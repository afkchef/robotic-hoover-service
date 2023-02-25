FROM python:3.9-slim

WORKDIR /robotic-hoover-service

COPY ./requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app/main.py"]