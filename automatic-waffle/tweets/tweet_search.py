import json, os
from twitter import Twitter, OAuth, TwitterHTTPError
from tweets.models import Tweet
from datetime import datetime
from tweets.sentiment import sentiment_api_call

def pull_tweets():

    package = {}
    package['APPID'] = os.environ['keys']

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


def add_tweets():
    tweets = pull_tweets()
    for i in tweets['statuses']:
        if not Tweet.objects.filter(tweet_id=i['id']).exists():
            tweet = Tweet()
            tweet.tweet_id = str(i['id'])
            tweet.username = i['user']['screen_name']
            tweet.text = i['text']
            tweet.created_at = datetime.strptime(i['created_at'], '%a %b %d %H:%M:%S %z %Y')
            tweet.save()

    analyze_tweets()
    return


def analyze_tweets():
    tweets = Tweet.objects.all()
    for i in tweets:
        if not i.pos:
            new_data = sentiment_api_call(i.tweet_id, i.text)
            i.pos = new_data['pos']
            i.neg = new_data['neg']
            i.neutral = new_data['neutral']
            i.label = new_data['label']
            i.save()
    return
