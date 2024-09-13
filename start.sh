#!/bin/sh

# Start the megadl command in the background
/app/venv/bin/python3 -m megadl &

# Start the app
/app/venv/bin/python3 /app/app.py
