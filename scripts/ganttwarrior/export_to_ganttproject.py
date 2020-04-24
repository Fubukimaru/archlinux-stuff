#!/usr/bin/python3
import csv
# import pytz
import datetime
from dateutil.parser import parse
from tasklib import TaskWarrior
import argparse
from numpy import busday_count

# Gantt definition
# #####################################
# Project: A collection of milestones.
# Milestone: A collection of tasks. A milestone is owned by a project.
# Task: Definition of a task that may contain others as subtasks. Task may
#   belong to a milestone. Task belong to a project.


def find_task(tasks, id):
    # TODO: This is not efficient.
    # It's horrible, it's linear and will make the rest go SLOW.
    # But as long as it's doable, it's ok. :D
    for i in range(len(tasks)):
        if tasks[i]['uuid'] == id:
            break
    if i == len(tasks) and tasks[i]['uuid'] == id:
        i = -1
    return(i)


def get_tags_matching(tasks, pattern="milestone_"):
    # TODO: Find a more efficent way to do this
    matching = set()
    for t in tasks:
        r = set([tag for tag in t['tags'] if pattern in tag])
        matching = matching.union(r)
    return(matching)


# Warning: We assume that each task has only one dependency. Makes sense for
# Gantts!
def build_numbering(tasks, id_list):
    for i in range(len(tasks)):
        tasks = resolve_numbering(tasks, id_list, i, "")
        print("-------------------")
    return(tasks)


def find_idlist(id_list, id):
    if id not in id_list.keys():
        id_list[id] = str(len(id_list)+1)  # Start in 1
    return(id_list[id])


def resolve_numbering(tasks, id_list, id, father_num):
    t = tasks[id]  # This is not a copy, it's a pointer :)
    if t['status'] == 'deleted':
        return(tasks)
    print("Resolving: " + str(t['uuid']))
    print("     -> " + str(t['description']))
    print("- Pater: " + father_num)
    if t['Outline number'] is None or t['Outline number'] == "":
        # Set the number given from father
        if t['new_id'] is None:
            # put a new ID to the task
            t['new_id'] = find_idlist(id_list, t['uuid'])

        if father_num == "":
            t['Outline number'] = t['new_id']
        else:
            t['Outline number'] = father_num + "." + t['new_id']
        print("Asigned #: " + t['Outline number'])
        deps = t['depends']
        if not isinstance(deps, set):
            deps.replace()  # From Lazy to a Set
        if len(deps) != 0:  # dependencies
            for i in range(len(deps)):
                next_id = deps[i]['uuid']
                print("Opening -> " + str(next_id))
                elem = find_task(tasks, next_id)
                if elem != -1:  # If it exists
                    tasks = resolve_numbering(
                            tasks, id_list, elem, t['Outline number'])
                else:
                    print(str(next_id) + " Not found")
    else:  # Revisiting node. Append father
        print("- Revisited")
        if (father_num != ""):
            tmp = father_num + "." + t['Outline number']
            if (len(tmp) > len(t['Outline number'])):
                t['Outline number'] = tmp
        print("Asigned #: " + t['Outline number'])
    return(tasks)


# TODO: Ask tasklib guys to implement task['end']
def get_task_end(tw, task):
    task_def = tw.execute_command([task['uuid']])
    end = [txt for txt in task_def if 'End' in txt]
    for e in end:
        e = e.split()
        if len(e) == 3:     # It's End + Date + Hour
            break
    return(parse(e[1]).date())


def add_element(prtasks, proj_id, project, start_time, end_time):
    prtasks.append(
            {  # ProjectGantt will get the max and min of the dates for us
                'ID': proj_id, 'Name': project,
                'Begin date': start_time.strftime('%d/%m/%y'),
                'End date': end_time.strftime('%d/%m/%y'),
                'Duration': 0, "Outline number": proj_id
            }
    )
    return(prtasks)


def set_id_prefix_to_task_id(tasks, prefix):
    for t in tasks:
        t['Outline number'] = prefix + "." + str(t['Outline number'])
    return(tasks)


def tasks_to_row(prtasks, tasks, tw, default_time_end):
    for t in tasks:
        if t['status'] != 'deleted':  # Ignore deleted tasks
            due = t['due']
            start = t['scheduled']
            # Process dates
            if due is None:
                if t.completed:
                    due = get_task_end(tw, t)
                else:
                    due = default_time_end
            else:
                due = due.date()
            if start is None:
                # Not available -> set the creation date
                start = t['entry'].date()  
            else:
                start = start.date()
            due_s = due.strftime('%d/%m/%y')
            start_s = start.strftime('%d/%m/%y')
            # Calculate num days
            if not (due is None or start is None):
                # days = (due - start).days
                days = busday_count(start, due)
            else:
                days = 0
            # Append tasks
            prtasks.append(
                    {
                        'ID': t['new_id'], 'Name': t['description'],
                        'Begin date': start_s, 'End date': due_s,
                        'Duration': days, "Outline number": t['Outline number']
                    }
            )
            # print(t['project'], t['id'], t['description'], t['depends'])
    return(prtasks)


def rows_to_csv(prtasks, filename):
    csv_columns = [
            'ID', 'Name', 'Begin date', 'End date', 'Duration',
            'Completion', 'Cost', 'Coordinator', 'Predecessors',
            'Outline number', 'Resources', 'Assignments', 'Task color',
            'Web Link', 'Notes'
    ]
    try:
        with open(filename, 'w') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
            writer.writeheader()
            for data in prtasks:
                writer.writerow(data)
    except IOError:
        print("I/O error")


def process_project(project, tw, id_list, prtasks,
        default_time_start, default_time_end,
        add_project=False):
    if add_project:
        proj_id = find_idlist(id_list, project)

    # Process milestones
    miles = get_tags_matching(tw.tasks)
    print(miles)

    if proj_id != "":  # If project set, add as element
        prtasks = add_element(
                prtasks, proj_id, "Project: " + project,
                default_time_start, default_time_end)

    # Process tasks of each milestone
    for m in miles:
        m_id = find_idlist(id_list, m)
        mt = "+" + m
        tasks = tw.tasks.filter(mt, project=project)
        tasks = build_numbering(tasks, id_list)

        # If project enabled set the project id to milestone
        if add_project:
            m_id = proj_id + "." + m_id

        # TODO: Change function name
        prtasks = add_element(
                prtasks, m_id, "Milestone: " + m, default_time_start,
                default_time_end)
        tasks = set_id_prefix_to_task_id(tasks, m_id)
        # To rows
        prtasks = tasks_to_row(prtasks, tasks, tw, default_time_end)

    # Process the rest
    no_miles_tag = '-' + ' -'.join(miles)
    tasks = tw.tasks.filter(no_miles_tag, project=project)
    tasks = build_numbering(tasks, id_list)
    # Set project id as prefix for the rest of tags
    if add_project:
        tasks = set_id_prefix_to_task_id(tasks, proj_id)
    prtasks = tasks_to_row(prtasks, tasks, tw, default_time_end)
    return(prtasks)


# ##################################### MAIN ##################################
def main():
    # ########################## Handling params and defaults
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument(
            '--projects', '-p', metavar="[Project names]", type=str, nargs="+",
            help='Projects that you want to make a gantt off. Example: -p\
            project_1 "project 2" project3'
    )
    parser.add_argument(
            '--output', '-o', type=str, default="tasks_gantt.csv",
            help="CSV file for output"
    )

    args = parser.parse_args()
    print(args)
    print(args.projects)

    if args.projects is None:
        print("Project is required")
        parser.print_help()
        exit()

    # Default start time
    # madrid = pytz.timezone("Europe/Madrid")
    default_time_start = datetime.date(2018, 1, 1)
    default_time_end = datetime.date(datetime.date.today().year, 12, 31)

    # ########################## PROGRAM START
    # Taskwarrior start
    tw = TaskWarrior()

    # init ID list
    id_list = dict()
    prtasks = []

    # Add id for project (and project) if they are more than one
    add_project_id = len(args.projects) > 1

    for project in args.projects:
        prtasks = process_project(
                project, tw, id_list, prtasks,
                default_time_start, default_time_end, add_project_id)

    rows_to_csv(prtasks, args.output)


# Main call
main()
