# Use a lightweight official Python runtime as a parent image
FROM python:3.10-slim

# Set environment variables so Python won’t buffer output (useful for logging)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a directory for the application
WORKDIR /app

# Copy only requirements first to leverage Docker layer caching
COPY app/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY app/app ./app
COPY app/run.py .

# Expose Flask port
EXPOSE 5000

# Define the command to run the application
CMD ["python", "run.py"]
