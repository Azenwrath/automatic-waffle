with open("tweets.txt", "r") as tweetsource:
    for line in tweetsource:
        try:
            if "text" in line:
                print(line.strip().split(':'))
        except:
            continue