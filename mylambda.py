
import datetime
import json

def my_handler(event, context):
    """
    minimal AWS lambda handler
    """
    msg={}
    msg["event"]=event
    msg["context"]=context
    msg["timestamp"]=datetime.datetime.now().strftime("%F - %H:%M")
    return { "message":json.dumps(msg) }
