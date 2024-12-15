FROM python:3.10-slim

# Install system dependencies for rasterio, geospatial libs, and lightgbm (omp)
# Adjust as needed for your environment
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gdal-bin libgdal-dev libgeos-dev libomp-dev \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy requirements
COPY requirements.txt ./

# Upgrade pip and install requirements
RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY src/ ./src/

# By default, just start a shell (the services will override the command)
CMD ["/bin/bash"]