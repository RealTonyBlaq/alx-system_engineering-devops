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
        name = requests.get("{}/{}/{}".format(url, "users", id)).json()['name']
        todos = requests.get("{}/{}".format(url, "todos")).json()
        tasks = 0
        completed = 0
        titles = []
        for dic in todos:
            if (dic['userId']) == id:
                tasks += 1
                if dic['completed'] is True:
                    completed += 1
                    titles.append(dic['title'])
    print(f"Employee {name} is done with tasks({completed}/{tasks}):")
    [print("\t {}".format(title)) for title in titles]
