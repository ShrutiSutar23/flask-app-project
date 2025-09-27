FROM python:3.12-slim

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    gcc \  
# required to build mysqlclient
    default-libmysqlclient-dev \
# MYSQL C libraries + headers
# helpds to find library configs
    pkg-config \
    python3-dev \
# Compile python extensions
    && rm -rf /var/lib/apt/lists/*

# SET WORKING DIRECTORY
WORKDIR /app

# COPY REQUIREMENTS first

COPY requirements.txt .

# INSTALL PYTHON DEPENDENCIES
RUN pip install  --no-cache-dir -r requirements.txt 

# COPY
COPY . .

EXPOSE 5000


CMD ["python","run.py"]

