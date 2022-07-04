FROM ubuntu:16.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip3 install setuptools-rust
RUN pip install flask 
RUN pip3 install flask 
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
