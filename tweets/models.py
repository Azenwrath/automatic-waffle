from django.db import models


class Tweet(models.Model):
    username = models.CharField(max_length=255)
    text = models.CharField(max_length=255)
    created_at = models.DateTimeField(blank=True, null=True)
    tweet_id = models.CharField(max_length=255, unique=True)
    pos = models.FloatField(blank=True, null=True)
    neg = models.FloatField(blank=True, null=True)
    neutral = models.FloatField(blank=True, null=True)
    label = models.CharField(max_length=10, blank=True, null=True)

    def __str__(self):
        return self.text[:50]