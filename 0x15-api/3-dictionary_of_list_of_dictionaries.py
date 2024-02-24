#!/usr/bin/python3
""" Script uses a REST API, for all employees,
and returns information about his/her TODO list progress
and exports all as a JSON file
"""

import json
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com"
    all = requests.get("{}/{}/{}".format(
        url, "users", id)).json()
        print(all)
        """todos = requests.get("{}/{}".format(url, "todos")).json()
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
            f.write(json.dumps(export))"""
