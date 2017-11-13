from django import template
from tweets.models import Tweet
register = template.Library()

@register.inclusion_tag('tweets/top3.html')
def top3(field, title):
    tweets = Tweet.objects.all().order_by('-' + field)[0:3]
    return {'top3': tweets, 'title': title }