# Use a more specific base image for better stability
FROM python:3.11-alpine

# Install system dependencies
RUN apk update && apk upgrade && \
    apk add --no-cache gcc python3-dev musl-dev linux-headers git ffmpeg

# Install megatools from edge/testing repository
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ megatools

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Set up the virtual environment and install dependencies
RUN python3 -m venv venv && \
    venv/bin/pip install -U pip && \
    venv/bin/pip install -r requirements.txt

# Use the virtual environment's Python to run the main application
CMD ["venv/bin/python3", "-m", "megadl"]
