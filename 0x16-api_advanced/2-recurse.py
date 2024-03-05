#!/usr/bin/python3
"""
Script queries the Reddit API and returns a list
containing the titles of all hot articles for a given subreddit
"""

import requests


def recurse(subreddit, hot_list=[]):
    if hot_list is None:
        hot_list = []

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
        'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124'
        'Safari/537.36 Edg/91.0.864.59'
    }
    params = {'limit': 100}
    if hot_list:
        params['after'] = hot_list[-1]['data']['name']
    response = requests.get(url, headers=headers, params=params)

    if response.status_code == 200:
        data = response.json()
        posts = data['data']['children']

        if posts:
            hot_list.extend(posts)
            if len(hot_list) >= 1000:
                return hot_list
            return recurse(subreddit, hot_list)
        else:
            return hot_list
    elif response.status_code == 404:
        return None
    else:
        return None
