from django.shortcuts import render, redirect
from tweets.models import Tweet


def index(request):
    all_tweets = Tweet.objects.all()
    tweets = collect_tweets_table()
    tweets_by_day = {}
    try:
        for i in tweets:
            tweets_by_day[i] = sentiment_to_dict(tweets[i], i[0], i[1], i[2])
    except TypeError:
        print("Failed sentiment analysis for tweets on: ", i)

    return render(request, 'tweets/index.html', {'tweets': all_tweets, 'tweets_by_day': tweets_by_day})


def sentiment_to_dict(results, month, day, year):  # TODO: Replace with some map and reduce
    total_pos, total_neg, total_neutral = 0, 0, 0

    for i in results:
        total_pos += i.pos
        total_neg += i.neg
        total_neutral += 1 - i.neutral
    length = len(results)
    total_pos /= length
    total_neg /= length
    total_neutral /= length
    return {'pos': total_pos, 'neg': total_neg, 'neutral': total_neutral, 'month': month - 1, "day": day, 'year': year}


def collect_tweets_table():
    tweets = Tweet.objects.all()
    tweets_by_day = {}

    for i in tweets:
        try:
            tweets_by_day[(i.created_at.month, i.created_at.day, i.created_at.year)].append(i)
        except KeyError:
            tweets_by_day[(i.created_at.month, i.created_at.day, i.created_at.year)] = [i]

    return tweets_by_day
