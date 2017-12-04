from django.core.management.base import BaseCommand
from tweets.tweet_search import pull_tweets
from datetime import datetime


class Command(BaseCommand):

    def handle(self, *args, **options):
        # This custom command triggers the tweet scraping process on a cron schedule. Args are discarded.
        pull_tweets()
        print('Scraped tweets at ', datetime.now())  # Minimal logging is provided.