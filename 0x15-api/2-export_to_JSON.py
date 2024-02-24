#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
and exports it to CSV using a format
"""

import requests
from sys import argv
import json


if __name__ == "__main__":
    if len(argv) != 2:
        print("Usage: ./0-gather_data_from_an_API.py <employee_ID>")
        exit(1)
    else:
        id = int(argv[1])
        url = "https://jsonplaceholder.typicode.com"
        username = requests.get("{}/{}/{}".format(url, "users",
                                              id)).json().get('username')
        todos = requests.get("{}/{}".format(url, "todos")).json()
        file = "{}.csv".format(id)
        export = {}
        with open(file, 'w') as f:
            export_value = []
            for dic in todos:
                if dic.get('userId') == id:
                    new = {"task": dic.get('title'), "completed": dic.get('completed'), "username": username}
                    export_value.append(new)
            export['{}'.format(id)] = export_value
