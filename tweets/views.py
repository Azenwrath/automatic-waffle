from django.shortcuts import render, redirect
from tweets.tweet_search import pull_tweets, read_tweets
from .models import Tweet
from datetime import datetime
from tweets.sentiment import sentiment_api_call
#
# from django.shortcuts import render, get_object_or_404, redirect
# from .models import Post, Comment
# from django.utils import timezone
# from .forms import PostForm, CommentForm
# from django.contrib.auth.decorators import login_required
# # Create your views here.

def index(request):

    tweets = read_tweets()
    return render(request, 'tweets/index.html', {'tweets':tweets})


def add_tweets(request):
    tweets = pull_tweets()
    # print(tweets['statuses'])
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