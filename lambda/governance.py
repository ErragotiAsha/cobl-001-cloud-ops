import json
import boto3
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        metadata = s3.head_object(Bucket=bucket, Key=key).get('Metadata', {})
        
        if 'project' not in metadata or 'environment' not in metadata:
            logger.info(f"GovernanceViolation: {key} missing mandatory tags")
        else:
            logger.info(f"ComplianceChecked: {key} passed all checks")
    
    return {
        'statusCode': 200,
        'body': json.dumps('Governance check complete')
    }
