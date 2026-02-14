def handler(event, context):
    print("Image received:", event['Records'][0]['s3']['object']['key'])
