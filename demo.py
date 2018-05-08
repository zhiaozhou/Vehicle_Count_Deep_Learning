import cv2
from flask import Flask, request, make_response
import base64
import numpy as np
import urllib

app = Flask(__name__)
        
@app.route('/')
def simple():
    import cv2
    img = cv2.imread('test.jpg')
    ret, jpeg = cv2.imencode('.jpg', img)
    response = make_response(jpeg.tobytes())
    response.headers['Content-Type'] = 'image/png'
    return response

if __name__ == "__main__":  
    print('listening on port %d' % 5000)  
    app.run(host='0.0.0.0', port=5000)  