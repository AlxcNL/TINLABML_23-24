#!/usr/bin/env python

from pathlib import PurePosixPath
import docker
import logging
import sys

# Global configuration

logging.basicConfig(level=logging.INFO)
containerName = "sandbox"
script = sys.argv[1]
script = PurePosixPath(script)
print(f"script : {script}")

def main():
    logging.info(f"Install in container {containerName}")
    sandbox = docker.Container(containerName)        
    sandbox.exec(script=script)

# Do NOT import this module
main()
