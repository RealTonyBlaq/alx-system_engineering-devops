#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
"""

import requests
from sys import argv

REST_API = "https://jsonplaceholder.typicode.com/todos/{}".format(argv[1])
r = requests(REST_API)
print(r.json())
