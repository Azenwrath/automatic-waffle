from django.shortcuts import render, redirect
from tweets.tweet_search import pull_tweets, read_tweets
from tweets.models import Tweet
from datetime import datetime
from tweets.sentiment import sentiment_api_call


#
#
# from django.shortcuts import render, get_object_or_404, redirect
# from .models import Post, Comment
# from django.utils import timezone
# from .forms import PostForm, CommentForm
# from django.contrib.auth.decorators import login_required
# # Create your views here.


def index(request):
    all_tweets = Tweet.objects.all()
    tweets = collect_tweets_table()
    tweets_by_day = {}
    for i in tweets:
        tweets_by_day[i] = sentiment_to_dict(tweets[i], i[0], i[1], i[2])
    #
    # data_for_table = [['Day', 'Positive', 'Negative', 'Neutral']]
    # for i in tweets_by_day:
    #     data_for_table.append([i, tweets_by_day[i]['pos'], tweets_by_day[i]['neg'], tweets_by_day[i]['neutral']])

    return render(request, 'tweets/index.html', {'tweets': all_tweets, 'tweets_by_day': tweets_by_day})


def add_tweets(request):
    tweets = pull_tweets()
    for i in tweets['statuses']:
        if not Tweet.objects.filter(tweet_id=i['id']).exists():
            tweet = Tweet()
            tweet.tweet_id = str(i['id'])
            tweet.username = i['user']['screen_name']
            tweet.text = i['text']
            tweet.created_at = datetime.strptime(i['created_at'], '%a %b %d %H:%M:%S %z %Y')
            tweet.save()
    return redirect('/admin/')


def analyze_tweets(request):
    tweets = Tweet.objects.all()
    for i in tweets:
        if not i.pos:
            new_data = sentiment_api_call(i.tweet_id, i.text)
            i.pos = new_data['pos']
            i.neg = new_data['neg']
            i.neutral = new_data['neutral']
            i.label = new_data['label']
            i.save()
    return redirect('/admin/')


def sentiment_to_dict(results, month, day, year):
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
