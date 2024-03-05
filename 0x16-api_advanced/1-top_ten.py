#!/usr/bin/python3
"""
Script queries the Reddit API and prints the titles
of the first 10 hot posts listed for a given subreddit
"""
import requests


def top_ten(subreddit):
    """
    prints the top 10 hot posts for a given reddit
    """
    URL = "https://www.reddit.com/r/{}/hot.json?limit=10".format(subreddit)
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
        'AppleWebKit/537.36'
        '(KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        'Edg/91.0.864.59'
    }
    response = requests.get(URL, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        data = response.json()
        for post in data['data']['children']:
            print(post['data']['title'])
    else:
        print(None)
