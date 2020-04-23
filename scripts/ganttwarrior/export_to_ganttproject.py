#!/usr/bin/python3
import csv
import pytz
import datetime
from tasklib import TaskWarrior
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument(
        '--project', '-p', metavar="[Project name]", type=str,
        help='Set project [Mandatory]'
)
parser.add_argument(
        '--set_id', '-i', type=str, default="", metavar="ID",
        help="Set project as task with this id. TODO: This should be bool"
)
parser.add_argument(
        '--output', '-o', type=str, default="tasks_gantt.csv",
        help="CSV file for output"
)

args = parser.parse_args()
print(args)
print(args.project)
if args.project is None:
    print("Project is required")
    parser.print_help()
    exit()

# Input config
project = args.project
proj_id = args.set_id   # "" -> project is not displayed
csv_file = args.output

# Default start time
madrid = pytz.timezone("Europe/Madrid")
default_time_start = datetime.datetime(2018, 1, 1, tzinfo=madrid)
default_time_end = datetime.datetime(2020, 7, 16, tzinfo=madrid)

csv_columns = [
        'ID', 'Name', 'Begin date', 'End date', 'Duration',
        'Completion', 'Cost', 'Coordinator', 'Predecessors',
        'Outline number', 'Resources', 'Assignments', 'Task color',
        'Web Link', 'Notes'
]


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


# id at first should be 0
# Warning: We assume that each task has only one dependency. Makes sense for
# Gantts!
def build_numbering(tasks, id_list):
    for i in range(len(tasks)):
        tasks = resolve_numbering(tasks, id_list, i, "")
        print("-------------------")
    return(tasks)


def find_idlist(id_list, id):
    if id not in id_list.keys():
        id_list[id] = str(len(id_list)+1) # Start in 1
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


# Taskwarrior start
tw = TaskWarrior()
tasks = tw.tasks.filter("project:" + project)

id_list = dict()
if proj_id != "":
    proj_id = '0'
    id_list[project] = proj_id

tasks = build_numbering(tasks, id_list)
prtasks = []
if proj_id != "":
    prtasks.append(
            {  # ProjectGantt will get the max and min of the dates for us
                'ID': proj_id, 'Name': "Project: " + project,
                'Begin date': default_time_start.strftime('%d/%m/%y'),
                'End date': default_time_end.strftime('%d/%m/%y'),
                'Duration': 0, "Outline number": proj_id
            }
    )
    for t in tasks:
        t['Outline number'] = proj_id + "." + str(t['Outline number'])
for t in tasks:
    if t['status'] != 'deleted':  # Ignore deleted tasks
        due = t['due']
        start = t['scheduled']
        # Process dates
        if due is None:
            due = default_time_end
        if start is None:
            start = default_time_start
        due_s = due.strftime('%d/%m/%y')
        start_s = start.strftime('%d/%m/%y')
        # Calculate num days
        if not (due is None or start is None):
            days = (due - start).days
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
try:
    with open(csv_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for data in prtasks:
            writer.writerow(data)
except IOError:
    print("I/O error")
