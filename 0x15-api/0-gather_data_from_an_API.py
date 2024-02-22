#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
"""

import requests
from sys import argv


if __name__ == "__main__":
    if len(argv) != 2:
        print("Usage: ./0-gather_data_from_an_API.py <employee_ID>")
        return None
    else:
        id = int(argv[1])
    REST_API = "https://jsonplaceholder.typicode.com/todos/{}".format(id)
    r = requests.get(REST_API)
    print(r.text)
