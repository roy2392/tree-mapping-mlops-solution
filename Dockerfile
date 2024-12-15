FROM python:3.10-slim

# Install system dependencies for rasterio, geospatial libs, and LightGBM (OMP)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gdal-bin libgdal-dev libgeos-dev libomp-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/ ./src/

# Default command (overridden by services in docker-compose)
CMD ["/bin/bash"]