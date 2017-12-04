from django.db import models


class Tweet(models.Model):
    username = models.CharField(max_length=255)
    text = models.CharField(max_length=255)
    created_at = models.DateTimeField(blank=True, null=True)
    # tweet_id saved as a CharField to nominally safeguard against casting to Int in JavaScript
    tweet_id = models.CharField(max_length=255, unique=True)
    pos = models.FloatField(blank=True, null=True)
    neg = models.FloatField(blank=True, null=True)
    neutral = models.FloatField(blank=True, null=True)
    label = models.CharField(max_length=10, blank=True, null=True)  # String received from sentiment analysis

    def __str__(self):
        return self.tweet_id