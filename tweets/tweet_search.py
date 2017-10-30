import requests
import tweets.config
import json
from twitter import Twitter, OAuth, TwitterHTTPError

#
def pull_tweets():
    pass
#     package = {}
#     package['APPID'] = tweets.config.keys
#
#     ACCESS_TOKEN = tweets.config.ACCESS_TOKEN
#     ACCESS_SECRET = tweets.config.ACCESS_SECRET
#     CONSUMER_KEY = tweets.config.CONSUMER_KEY
#     CONSUMER_SECRET = tweets.config.CONSUMER_SECRET
#
#     oauth = OAuth(ACCESS_TOKEN, ACCESS_SECRET, CONSUMER_KEY, CONSUMER_SECRET)
#     # req = requests.post('http://api.openweathermap.org/data/2.5/weather?', params=package)
#     # pyobj = req.json()
#     # pyobj = json.loads(req.content)
#     twitter = Twitter(auth=oauth)
#     newtweets = twitter.search.tweets(q="#wafflehouse")
#     tweetport = json.dumps(newtweets, indent=4)
#
#     with open("tweets.txt", "w") as tweetfile:
#         for line in tweetport:
#             tweetfile.write(line)
#
#     return newtweets


def read_tweets():

    with open("tweets.txt", 'r') as tweetfile:
        parsed_tweets = json.load(tweetfile)
        return parsed_tweets

#
#
# # strippedtweets = json.load(tweets)
# print(tweets)
#
# # print json.dumps(tweets, indent=4)
# #
# tweetport = json.dumps(tweets, indent=4)
#
#
# with open("tweets.txt", "w") as tweetfile:
#
#     for line in tweetport:
#         tweetfile.write(line)
#
#
# # for i in tweets:
# #     try:
# #         tweet = json.loads(i.strip())
# #         print(i)
# #         print("Tweet: ", tweet)
# #         if 'text' in tweet:
# #             print tweet['id']  # This is the tweet's id
# #             print tweet['created_at']  # when the tweet posted
# #             print tweet['text']  # content of the tweet
# #
# #             print tweet['user']['id']  # id of the user who posted the tweet
# #             print tweet['user']['name']  # name of the user, e.g. "Wei Xu"
# #             print tweet['user']['screen_name']  # name of the user account, e.g. "cocoweixu"
# #
# #             hashtags = []
# #             for hashtag in tweet['entities']['hashtags']:
# #                 hashtags.append(hashtag['text'])
# #             print hashtags
# #
# #     except:
# #         # read in a line is not in JSON format (sometimes error occured)
# #         continue
