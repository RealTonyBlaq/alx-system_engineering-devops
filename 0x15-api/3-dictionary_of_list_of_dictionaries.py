#!/usr/bin/python3
""" Script uses a REST API, for all employees,
and returns information about his/her TODO list progress
and exports all as a JSON file
"""

import json
import requests


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com"
    employees = requests.get("{}/{}".format(url, "users")).json()
    todos = requests.get("{}/{}".format(url, "todos")).json()
    export = {}
    export_value = []
    for employee in employees:
        
        for dic in todos:
            if dic.get('userId') == id:
                new = {"task": dic.get('title'),
                    "completed": dic.get('completed'),
                    "username": username}
                export_value.append(new)
        export['{}'.format(id)] = export_value
    with open("todo_all_employees.json", 'w') as f:
        f.write(json.dumps(export))
