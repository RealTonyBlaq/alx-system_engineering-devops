#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
and exports it to CSV using a format
"""

import requests
from sys import argv


if __name__ == "__main__":
    if len(argv) != 2:
        print("Usage: ./1-export_to_CSV.py <employee_ID>")
        exit(1)
    else:
        id = int(argv[1])
        url = "https://jsonplaceholder.typicode.com"
        name = requests.get("{}/{}/{}".format(url, "users",
                                              id)).json().get('username')
        todos = requests.get("{}/{}".format(url, "todos")).json()
        file = "{}.csv".format(id)
        with open(file, 'w') as f:
            for dic in todos:
                if dic.get('userId') == id:
                    dump = '"{}","{}","{}","{}"\n'
                    f.write(dump.format(id, name,
                                        dic.get("completed"),
                                        dic.get("title")))
