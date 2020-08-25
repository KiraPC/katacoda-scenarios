Create the Python file

## Create the Script

Create a folder that will contains the script

`mkdir app`{{execute}}

Create a Python script that will print 'Hello World'

`echo 'print("Hello World")' > app/custom_image.py && ls`{{execute}}

## Create the Dockerfile

Docker file is a configuration file that tells docker how to create the image

`echo -e 'FROM python:alpine3.7\nCOPY app /app\nWORKDIR /app \nCMD python ./custom_image.py' > Dockerfile && ls`{{execute}}

## Build the image

With the build command inside a folder within a dockerfile, Docker will use the information inside that file to build the image

`docker build --tags my-custom-image .`{{execute}}

## Check if the image is correctly created

With the command 'images' you can list all of the local images, includes custom and downloaded

`docker images | grep my-custom-image`{{execute}}

If my-custom-image appear in read it was correctly created

## Test the image

Now that our image is built, we can test it.

`docker run my-custom-image`{{execute}}

You can see now on the screen the message 'Hello World' printed on the console