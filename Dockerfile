# Start from a small official Python image
FROM python:3.12-slim

# Set the working folder inside the container
WORKDIR /app

# Copy requirements first (lets Docker cache this step)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Document the port the app uses
EXPOSE 5000

# Command to run when the container starts
CMD ["python", "app.py"]