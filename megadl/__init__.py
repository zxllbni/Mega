# Copyright (c) 2021 - Present Itz-fork
# Author: https://github.com/Itz-fork
# Project: https://github.com/Itz-fork/Mega.nz-Bot
# Description: __init__.py

import os
import logging
import importlib

# start msg
print("Mega.nz Bot - Cypher is starting...")

# loading config
from dotenv import load_dotenv
print("--------------------")
print("> Loading config")
if os.path.isfile('.env'):
    load_dotenv()
else:
    logging.warning("WARNING: No .env file found")

# client
from .helpers.cypher import MeganzClient
CypherClient: "MeganzClient" = MeganzClient()

# Plugin loading
PLUGIN_DIR = "megadl/modules"

def load_plugins():
    print("> Loading plugins from", PLUGIN_DIR)
    if not os.path.exists(PLUGIN_DIR):
        logging.warning(f"WARNING: Plugin directory {PLUGIN_DIR} does not exist")
        return

    for filename in os.listdir(PLUGIN_DIR):
        if filename.endswith(".py"):
            plugin_name = filename[:-3]  # Remove .py extension
            try:
                print(f"> Loading plugin: {plugin_name}")
                importlib.import_module(f"megadl.modules.{plugin_name}")
            except Exception as e:
                logging.error(f"Error loading plugin {plugin_name}: {e}")

# Load plugins
load_plugins()
