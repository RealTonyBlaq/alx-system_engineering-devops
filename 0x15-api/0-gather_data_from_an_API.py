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
        employee = requests.get("{}/{}/{}".format(url, "users", id)).json()
        todos = requests.get("{}/{}".format("todos", None))
        print(todos.json())
