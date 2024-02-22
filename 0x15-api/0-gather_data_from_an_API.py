#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
"""

import requests
from sys import argv


if __name__ == "__main__":
    if len(argv) != 2:
        print("Usage: ./0-gather_data_from_an_API.py <employee_ID>")
        exit(1)
    else:
        id = int(argv[1])
        url = "https://jsonplaceholder.typicode.com"
        employee = requests.get("{}/{}/{}".format(url, "users", id)).json()['name']
        todos = requests.get("{}/{}".format(url, "todos")).json()
        tasks = 0
        tasks_completed = 0
        for dic in todos:
            for key in dic.keys():
                if key['userId'] == id:
                    tasks += 1
                    if key['completed'] == True:
                        tasks_completed += 1
