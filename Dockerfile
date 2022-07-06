FROM alpine:3.15 


WORKDIR /usr/src/app
# Install required packages
RUN apk add --update --no-cache bash dos2unix

RUN apk --update add redis 

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip install Redis
RUN pip install celery


# Copy files
COPY crontab.* ./
COPY . ./

# Fix line endings && execute permissions
RUN dos2unix crontab.* \
    && \
    find . -type f -iname "*.sh" -exec chmod +x {} \;
#ENTRYPOINT ["./celery_start.sh"]
CMD  ["./my_wrapper_script.sh"]

