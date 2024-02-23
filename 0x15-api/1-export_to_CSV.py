#!/usr/bin/python3
""" Script uses a REST API, for a given employee ID,
and returns information about his/her TODO list progress
and exports it to CSV using a format
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
        name = requests.get("{}/{}/{}".format(url, "users",
                                              id)).json()['username']
        todos = requests.get("{}/{}".format(url, "todos")).json()
        file = "USER_ID.csv"
        with open(file, '+a') as f:
            for dic in todos:
                if (dic['userId']) == id:
                    dump = '"{}","{}","{}","{}"'
                    f.write(dump.format(id, name, dic["completed"], dic["title"]))
