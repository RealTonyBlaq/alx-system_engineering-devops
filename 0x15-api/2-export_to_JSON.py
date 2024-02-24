#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
and exports it as a JSON file
"""

import requests
from sys import argv
import json


if __name__ == "__main__":
    if len(argv) != 2:
        print("Usage: ./2-export_to_JSON.py <employee_ID>")
        exit(1)
    else:
        id = argv[1]
        url = "https://jsonplaceholder.typicode.com"
        username = requests.get("{}/{}/{}".format(
            url, "users", id)).json().get('username')
        todos = requests.get("{}/{}".format(url, "todos")).json()
        file = "{}.json".format(id)
        with open(file, 'w') as f:
            export = {}
            export_value = []
            for dic in todos:
                if dic.get('userId') == id:
                    new = {"task": dic.get('title'),
                           "completed": dic.get('completed'),
                           "username": username}
                    export_value.append(new)
            export['{}'.format(id)] = export_value
            f.write(json.dumps(export))
