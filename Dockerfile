FROM python:alpine3.7
COPY app /app
WORKDIR /app 
CMD python ./custom_image.py
