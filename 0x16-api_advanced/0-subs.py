#!/usr/bin/python3
"""
Script queries the Reddit API and returns the number of
subscribers (not active users, total subscribers) for a given subreddit
"""

import requests


def number_of_subscribers(subreddit):
    """ Returns number of total subscribers """
