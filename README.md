This is a small educational Django project by Dana Stubkjaer<br> 
<dana.stubkjaer@gmail.com>

Waffle House Index v.2
===

From Wikipedia:
-
The Waffle House Index is an informal metric used by the Federal Emergency Management Agency (FEMA) to determine the effect of
a storm and the likely scale of assistance required for disaster recovery.[1] "If you get there and the Waffle House is closed? 
That's really bad. That's when you go to work."[2] The Waffle House Index has not seen wide use outside of its value as a novel 
statistic.

Project: 
--

This project exlores novel approaches to identifying Waffle house behavior through live data mining and sentiment analysis. The 
bot scrapes Twitter every 15 minutes for mentions for Waffle House up to the Twitter rate limit for free searches. Each Tweet 
is then run through a naive Bayes classifier trained on movie review and twitter data sets by Bo Pang and Lillian Lee of 
Cornell University. Each Tweet is rated for positivity, negativity, and neutrality. Positive and negative sentiment represent 
positive and negative emotional affect and will always add up to one. Neutrality is indepdendt from the positive-negaitve axis, 
and it represents the intensity of sentiment in a given text. Tweets such as "At @WaffleHouse" show high neutrality scores. 
Values shown are the arithmetic mean by day. All sentiment analysis is done on the text of the tweet, with no additional 
consideration given for other Tweet specific variables like number of followers, retweets, verified accounts, etc. This project 
contains live Twitter data which may contain inappropriate or problematic language.

This data is not intended for emergency management use.

References
McKenna, Maryn (6 December 2016). "If Waffle House Is Closed, It's Time To Panic". FiveThirtyEight. Retrieved 14 December 2016.
"How to Measure a Storm's Fury One Breakfast at a Time". Wall Street Journal. September 1, 2011.
