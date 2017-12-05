import requests, os
# from tweets.config import mashape


def sentiment_api_call(tweet_id, outside_text):
    headers = {
        "X-Mashape-Key": os.environ['mashape'],
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json"}

    params = {
        "language": "english",
        "text": outside_text,
    }

    response = requests.post("https://japerk-text-processing.p.mashape.com/sentiment/", data=params, headers=headers)
    response_json = response.json()
    if response.status_code == 200:
        return_dict = {
            "pos": response_json['probability']['pos'],
            "neg": response_json['probability']['neg'],
            "neutral": response_json['probability']['neutral'],
            "label": response_json['label']
        }
    else:
        print('Sentiment API call failed on tweet: ', tweet_id)

    return return_dict