#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
"""

import requests
from sys import argv


id = int(argv[1])
REST_AP = "https://jsonplaceholder.typicode.com/users/{}".format(id)
r = requests.get(REST_API)
print(r.text)
