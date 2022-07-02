FROM python
ENV PYTHONBUFFERED=1

COPY . ./

RUN pip install celery
RUN pip install Redis