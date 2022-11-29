FROM python:latest

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV GOOGLE_APPLICATION_CREDENTIALS="../fellowship8-devanis-b3891121eb2b.json"

CMD ["python", "./main.py"]