# Use a lightweight Python image
FROM python:3.11-slim

# Set environment variables to prevent Python from writing .pyc files & ensure Python output is not buffered
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install system dependencies required by LightGBM and venv
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    python3.11-venv \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the application code
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -e .

# Optional: create virtual environment (you can skip this if not required inside Docker)
# RUN python -m venv venv && . venv/bin/activate

# Train the model before running the application
RUN python pipeline/training_pipeline.py

# Expose the port that Flask will run on
EXPOSE 8080

# Command to run the app
CMD ["python", "app.py"]
