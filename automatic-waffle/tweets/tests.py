from django.test import TestCase
from tweets.models import Tweet
from tweets.tweet_search import pull_tweets
# Create your tests here.

class TweetTestCase(TestCase):
    def setUp(self):
       pull_tweets()

    def test_tweets(self):
        self.tweets = Tweet.objects.all()
        for i in self.tweets:
            self.assertIsNotNone(i.username)
            self.assertIsNotNone(i.text)
            self.assertIsNotNone(i.created_at)
            self.assertIsNotNone(i.tweet_id)
            self.assertIsNotNone(i.label)
            self.assertTrue(0 < i.pos < 1)
            self.assertTrue(0 < i.neg < 1)
            self.assertTrue(0 < i.neutral < 1)
