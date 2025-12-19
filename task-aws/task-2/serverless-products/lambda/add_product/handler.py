import json
import boto3
import uuid
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    body = json.loads(event['body'])

    item = {
        "id": str(uuid.uuid4()),
        "name": body["name"],
        "price": body["price"]
    }

    table.put_item(Item=item)

    return {
        "statusCode": 201,
        "body": json.dumps(item)
    }
