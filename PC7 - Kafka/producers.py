from confluent_kafka import Producer
import json
import time
import logging
import tweepy

# Logging Kafka using Confluent
logging.basicConfig(format='%(asctime)s %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S',
                    filename='producer.log',
                    filemode='w')

logger = logging.getLogger()
logger.setLevel(logging.INFO)

topic_name = "FIFAWorldCup"

# Twitter API Authorization
api_key = "xxx"
api_key_Secret = "xxx"
access_token = "xxx"
access_token_secret = "xxx"
bearer_token = "xxx"

def authenticateTwitterApp(topic_name):
    auth = tweepy.OAuthHandler(api_key, api_key_Secret)
    auth.set_access_token(access_token, access_token_secret)
    client = tweepy.API(auth)
    client = tweepy.Client(bearer_token)
    tweets = client.search_recent_tweets(query=topic_name, max_results=100)
    return tweets

producer = Producer({'bootstrap.servers':'localhost:9092'})
print('Kafka Producer has been initiated...')

def receipt(err, msg):
    if err is not None:
        print('Error: {}'.format(err))
    else:
        message = 'Produced message on topic {} with value of {}\n'.format(msg.topic(), msg.value().decode('utf-8'))
        logger.info(message)
        print(message)

def main():
    for tweet in tweets.data:
        data = {
            'id': tweet.id,
            'text': tweet.text
        }
        m = json.dumps(data)
        producer.poll(1)
        producer.produce('FIFAWorldCup', m.encode('utf-8'), callback=receipt)
        producer.flush()
        time.sleep(3)


if __name__ == "__main__":
    tweets = authenticateTwitterApp(topic_name)
    main()