# Use a lightweight Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install system dependencies required by LightGBM
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy only essential code and config
COPY setup.py requirements.txt ./
COPY src/ src/
COPY config/ config/
COPY utils/ utils/
COPY pipeline/ pipeline/
COPY templates/ templates/
COPY static/ static/        
COPY app.py .


# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Optional: install package in editable mode if needed
RUN pip install --no-cache-dir -e .

# Expose Flask port
EXPOSE 5001

# Default command
CMD ["python", "app.py"]
