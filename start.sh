#!/bin/sh

# Start the megadl command in the background
venv/bin/python3 -m megadl &

# Start the app using gunicorn
python3 app.py
