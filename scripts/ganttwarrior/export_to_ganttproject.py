#!/usr/bin/python3
import csv
import pytz
import datetime
from tasklib import TaskWarrior

tw = TaskWarrior()

project = "GANTT"
proj_id = "1"   # "" -> project is not displayed
tasks = tw.tasks.filter("project:" + project)

csv_columns = [
        'ID', 'Name', 'Begin date', 'End date', 'Duration',
        'Completion', 'Cost', 'Coordinator', 'Predecessors',
        'Outline number', 'Resources', 'Assignments', 'Task color',
        'Web Link', 'Notes'
]

madrid = pytz.timezone("Europe/Madrid")

# Default start time
default_time_start = datetime.datetime(2020, 3, 3, tzinfo = madrid)
default_time_end = datetime.datetime(2020, 7, 16, tzinfo = madrid)


def find_task(tasks, id):
    # TODO: This is not efficient.
    # It's horrible, it's linear and will make the rest go SLOW.
    # But as long as it's doable, it's ok. :D
    for i in range(len(tasks)):
        if tasks[i]['id'] == id:
            break
    if i == len(tasks) and tasks[i]['id'] == id:
        i = -1
    return(i)

# id at first should be 0
# Warning: We assume that each task has only one dependency. Makes sense for
# Gantts!
def build_numbering(tasks):
    for i in range(len(tasks)):
        tasks = resolve_numbering(tasks, i, "")
        print("-------------------")
    return(tasks)


def resolve_numbering(tasks, id, father_num):
    t = tasks[id]  # This is not a copy, it's a pointer :)
    if t['id'] == 0:
        return(tasks)
    print("Resolving: " + str(t['id']))
    print("     -> " + str(t['description']))
    print("- Pater: " + father_num)
    if t['Outline number'] is None or t['Outline number'] == "":
        # Set the number given from father
        if father_num == "":
            t['Outline number'] = str(t['id'])
        else:
            t['Outline number'] = father_num + "." + str(t['id'])
        print("Asigned #: " + t['Outline number'])
        deps = t['depends']
        if not isinstance(deps, set):
            deps.replace()  # From Lazy to a Set
        if len(deps) != 0:  # dependencies
            for i in range(len(deps)):
                nid = deps[i]['id']
                print("Opening -> " + str(nid))
                elem = find_task(tasks, nid)
                if elem != -1:  # If it exists
                    tasks = resolve_numbering(tasks, elem, t['Outline number'])
                else:
                    print(str(nid) + " Not found")
    else:  # Revisiting node. Append father
        print("- Revisited")
        if (father_num != ""):
            tmp = father_num + "." + t['Outline number']
            if (len(tmp) > len(t['Outline number'])):
                t['Outline number'] = tmp
        print("Asigned #: " + t['Outline number'])
    return(tasks)


tasks = tw.tasks.filter("project:GANTT")
tasks = build_numbering(tasks)

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
    if t['id'] != 0:
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
                    'ID': t['id'], 'Name': t['description'],
                    'Begin date': start_s, 'End date': due_s,
                    'Duration': days, "Outline number": t['Outline number']
                }
        )
        # print(t['project'], t['id'], t['description'], t['depends'])
csv_file = "/home/fubu/tasking.csv"
try:
    with open(csv_file, 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for data in prtasks:
            writer.writerow(data)
except IOError:
    print("I/O error")
