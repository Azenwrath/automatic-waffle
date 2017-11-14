import json, os
from twitter import Twitter, OAuth, TwitterHTTPError

#
def pull_tweets():

    package = {}
    package['APPID'] = tweets.config.keys

    ACCESS_TOKEN = os.environ['ACCESS_TOKEN']
    ACCESS_SECRET = os.environ['ACCESS_SECRET']
    CONSUMER_KEY = os.environ['CONSUMER_KEY']
    CONSUMER_SECRET = os.environ['CONSUMER_SECRET']

    oauth = OAuth(ACCESS_TOKEN, ACCESS_SECRET, CONSUMER_KEY, CONSUMER_SECRET)

    twitter = Twitter(auth=oauth)
    newtweets = twitter.search.tweets(q="#wafflehouse", count=100)
    return newtweets


def read_tweets():

    with open("tweets.txt", 'r') as tweetfile:
        parsed_tweets = json.load(tweetfile)
        return parsed_tweets
