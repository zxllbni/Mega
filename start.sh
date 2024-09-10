# start.sh
#!/bin/sh
# Start the megadl command in the background
venv/bin/python3 -m megadl &
# Start the app
venv/bin/python3 app.py
