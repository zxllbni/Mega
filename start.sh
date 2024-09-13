#!/bin/sh

# Start the megadl command in the background
python3 -m megadl &

# Start the app
python3 app.py
