#!/usr/bin/env python
# Author: J.A.Boogaard@hr.nl

from pathlib import PurePosixPath

import docker
import logging
import time
import webbrowser

# Global configuration
scriptPath = PurePosixPath("/etc").joinpath("skel")
logging.basicConfig(level=logging.INFO)
containerName = "sandbox"
waitWithBrowser = 3
url = "http://localhost:3000/"

def main():
    logging.info(f"Start container {containerName}")
    sandbox = docker.Container(containerName)    
    sandbox.start()
    time.sleep(waitWithBrowser)
    webbrowser.open(url)

# Do NOT import this module
main()