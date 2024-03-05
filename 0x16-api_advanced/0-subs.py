#!/usr/bin/python3
"""
Script queries the Reddit API and returns the number of
subscribers (not active users, total subscribers) for a given subreddit
"""

import requests


def number_of_subscribers(subreddit):
    """ Returns number of total subscribers """
    URL = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
        'AppleWebKit/537.36'
        '(KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        'Edg/91.0.864.59'
    }
    response = requests.get(URL, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        data = response.json()
        return data['data']['subscribers']
    return 0
