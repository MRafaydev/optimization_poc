FROM python:3.8-buster

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --upgrade pip
# Set up pip proxy server
#RUN pip install --no-cache-dir --trusted-host 54.197.154.136 fastapi \ 
#    --index-url http://admin:admin@54.197.154.136:8081/repository/pypi-proxy/simple 
RUN pip install --trusted-host 34.224.27.162 -r requirements.txt  --index-url http://admin:admin@34.224.27.162:8081/repository/pypi-remote/simple/

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
