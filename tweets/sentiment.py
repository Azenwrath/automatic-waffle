import requests


def sentiment_api_call(outside_tweet_id, outside_text):

    headers = {
        "X-Mashape-Key": "sACoZbcekAmshow29CNoYg1fXEAdp1Gc4Ctjsnw7eSS6DXts2s",
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json"}

    params = {
        "language": "english",
        "text": outside_text,
    }

    response = requests.post("https://japerk-text-processing.p.mashape.com/sentiment/", data=params, headers=headers)

    print("Requests got: ", response, response.text, response.json())
    print("Response.text: ", response.text)
    response_json = response.json()
    print("Response.json: ", response_json)
    print("JSON dict call:", response_json['probability'])
    print("JSON pos: ", response_json['probability']['pos'])
    print("JSON neg: ", response_json['probability']['neg'])
    print("JSON neutral: ", response_json['probability']['neutral'])
    print("JSON label: ", response_json['label'])


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