# Dockerfile for book_catalog microservice
# Use an official base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app/

# Copy project files to the container
COPY  book_catalog/requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

ENV DATABASE_URL="postgresql://varshweek08_user:JFfJtuRVwpIEVLAy6r6cNjnj4kxCvgvA@dpg-cri18vrtq21c738599pg-a.oregon-postgres.render.com/varshweek08"

COPY /book_catalog/ ./

# Specify the command to run on container start
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
