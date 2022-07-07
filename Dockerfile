FROM ubuntu:16.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean
ADD folder /opt/app.py
WORKDIR /opt/app.py
CMD python ./main.py
RUN python -m pip3 install --upgrade pip3 setuptools wheel
RUN pip3 install setuptools-rust
RUN pip3 install flask
RUN mkdir /opt
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
