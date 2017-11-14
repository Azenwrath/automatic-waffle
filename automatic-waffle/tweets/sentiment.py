import requests, os
# from tweets.config import mashape


def sentiment_api_call(outside_tweet_id, outside_text):
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
    return_dict = {
        "tweet_id": outside_text,
        "pos": response_json['probability']['pos'],
        "neg": response_json['probability']['neg'],
        "neutral": response_json['probability']['neutral'],
        "label": response_json['label']
    }

    return return_dict


if __name__ == '__main__':
    sentiment_api_call(100, "This waffle house is currently on fire")
