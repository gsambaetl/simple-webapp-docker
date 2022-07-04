FROM ubuntu:16.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.6.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install flask 
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
