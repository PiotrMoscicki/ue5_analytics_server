FROM python:3.10-slim-buster
# install psycopg2 dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*
    
# copy and install requirements 
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy and run main script
COPY main.py .
CMD ["python", "main.py"]