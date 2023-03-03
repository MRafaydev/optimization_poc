FROM python:3.8-buster

WORKDIR /app

COPY requirements.txt .

# Set up pip proxy server
ENV http_proxy http://3.89.27.27:8081/
ENV https_proxy https://3.89.27.27:8081/

RUN mkdir -p /pip-cache && \
    pip install --no-cache-dir --trusted-host pypi-proxy -r requirements.txt \
    --cache-dir /pip-cache \
    --no-warn-script-location

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
