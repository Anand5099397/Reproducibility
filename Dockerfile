# Step 1: Use the official Python 3.9 slim image as the base
FROM python:3.9-slim

# Step 2: Set the working directory inside the container
WORKDIR /workspace

# Step 3: Copy all files from the current directory to the container
COPY . .

# Step 4: Install system-level dependencies for building Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Step 5: Install Python dependencies from the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Step 6: (Optional) Expose port 80 for web-based services
EXPOSE 80

# Step 7: Set an environment variable
ENV NAME=MLOpsLab

# Step 8: Define the default command to run when the container starts
CMD ["python", "train.py"]

