from django.shortcuts import render, redirect
from tweets.models import Tweet


def index(request):

    tweets = map_tweets_to_dates()  # Collects all tweets and maps them to a dict keyed by a day/month/year tuple
    tweets_by_day = {}
    try:  # Calculates the average scores by day
        for i in tweets:
            tweets_by_day[i] = reduce_days_tweets_to_average(tweets[i], i[0], i[1], i[2])
    except TypeError:
        print("Failed sentiment analysis for tweets on: ", i)

    return render(request, 'tweets/index.html', {'tweets_by_day': tweets_by_day})


def reduce_days_tweets_to_average(results, month, day, year):
    """ This function reduces the scores per day to a single average"""
    total_pos, total_neg, total_neutral = 0, 0, 0

    for i in results:  # Calculate totals
        total_pos += i.pos
        total_neg += i.neg
        total_neutral += 1 - i.neutral

    length = len(results)  # Calculate size

    total_pos /= length  # Calculate averages
    total_neg /= length
    total_neutral /= length

    return {'pos': total_pos, 'neg': total_neg, 'neutral': total_neutral, 'month': month - 1, "day": day, 'year': year}


def map_tweets_to_dates():
    """This function returns a dict keyed by month/day/year tuples with values of lists of tweets for that day"""

    tweets = Tweet.objects.all()
    tweets_by_day = {}

    for i in tweets:
        try:  # Append each tweet to the appropriate key if it exists
            tweets_by_day[(i.created_at.month, i.created_at.day, i.created_at.year)].append(i)
        except KeyError:  # Or create a new key
            tweets_by_day[(i.created_at.month, i.created_at.day, i.created_at.year)] = [i]

    return tweets_by_day





