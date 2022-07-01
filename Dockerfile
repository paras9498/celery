FROM python
ENV PYTHONBUFFERED=1
WORKDIR /usr/src/app

COPY . ./

RUN pip install celery
RUN pip install Redis