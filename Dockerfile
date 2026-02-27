FROM python:3.11 AS builder
WORKDIR /Flask_app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .


FROM python:3.11-slim
WORKDIR /Flask_app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY . .
EXPOSE 5005
CMD ["python", "run.py"]

