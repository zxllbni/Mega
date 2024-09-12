#!/bin/sh

# Start the megadl command in the background
/app/venv/bin/python3 -m megadl &

# Start the app on port 8000 (or the required port)
gunicorn --bind 0.0.0.0:8000 app:app
