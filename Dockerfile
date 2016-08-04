FROM python:2.7-wheezy

COPY udngateway /opt/udngateway/

RUN pip install -r /opt/udngateway/requirements.txt

