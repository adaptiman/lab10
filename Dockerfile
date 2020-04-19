# start from base
FROM ubuntu:latest

# install system-wide deps for python and node
RUN apt-get -yqq update
RUN apt-get -yqq install python-pip python-dev curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -yq nodejs

# copy our application code
ADD flask-app /opt/flask-app
WORKDIR /opt/flask-app

# fetch app specific deps
RUN npm install
RUN npm run build
RUN pip install -r requirements.txt

# fix vulnerability reported in build
# RUN npm install --save-dev webpack@4.42.1

# expose port
EXPOSE 5000

# start app
CMD [ "python", "./app.py" ]
