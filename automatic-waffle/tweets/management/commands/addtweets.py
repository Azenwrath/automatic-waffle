from django.core.management.base import BaseCommand
from tweets.tweet_search import add_tweets

class Command(BaseCommand):

    def handle(self, *args, **options):
        add_tweets();


