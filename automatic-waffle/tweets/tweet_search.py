import os
from twitter import Twitter, OAuth, TwitterHTTPError
from tweets.models import Tweet
from datetime import datetime
from tweets.sentiment import sentiment_api_call

# Hooks together twitter scrapping, saving new tweets to database, and analyzes tweets.
# All functions are chained together and triggered by the addtweets manage.py command on a cron schedule.


def pull_tweets():  # Scrapes Twitter for last 100 relevant tweets.

    # Assorted Twitter API keys.
    ACCESS_TOKEN = os.environ['ACCESS_TOKEN']
    ACCESS_SECRET = os.environ['ACCESS_SECRET']
    CONSUMER_KEY = os.environ['CONSUMER_KEY']
    CONSUMER_SECRET = os.environ['CONSUMER_SECRET']

    oauth = OAuth(ACCESS_TOKEN, ACCESS_SECRET, CONSUMER_KEY, CONSUMER_SECRET)

    twitter = Twitter(auth=oauth)
    new_tweets = twitter.search.tweets(q="#wafflehouse", count=100)  # Searches for last 100 relevant tweets

    # Adds scraped tweets to the database
    add_tweets(new_tweets)

    return True


def add_tweets(new_tweets):
    # New tweets are saved to the database
    tweets = new_tweets
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
    # Finally each tweet is analyzed through an API call to a free sentiment analysis API
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
