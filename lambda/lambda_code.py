# Import necessary libraries
import json
import boto3

# Connect to DynamoDB resource
dynamodb = boto3.resource('dynamodb')

# Select the DynamoDB table named 'VisitorCounter'
table = dynamodb.Table('VisitorCounter')

# Lambda function handler
def lambda_handler(event, context):
    # Retrieve the item with key 'id' equal to '1' from the DynamoDB table
    response = table.get_item(Key={'id': 1})
    
    # Extract the current value of 'views' from the retrieved item
    views = response['Item']['views']
    
    # Increment the 'views' count by 1
    views = views + 1
    
    # Print the updated 'views' count (This print statement is for debugging purposes)
    print(views)
    
    # Update the DynamoDB item with the new 'views' count
    response = table.put_item(Item={'id': 1, 'views': views})
    return views