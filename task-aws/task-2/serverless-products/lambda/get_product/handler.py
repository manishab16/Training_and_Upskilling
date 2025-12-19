import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    product_id = event['pathParameters']['id']

    response = table.get_item(Key={"id": product_id})

    if "Item" not in response:
        return {"statusCode": 404, "body": "Product not found"}

    return {
        "statusCode": 200,
        "body": json.dumps(response["Item"])
    }
