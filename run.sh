#!/bin/bash

# Run the first command for the worker
venv/bin/python3 -m megadl &

# Run the second command for app.py
python3 app.py &
wait
