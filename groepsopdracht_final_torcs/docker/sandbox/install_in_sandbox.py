#!/usr/bin/env python

from pathlib import PurePosixPath
import docker
import logging

# Global configuration

logging.basicConfig(level=logging.INFO)
containerName = "sandbox"
script = PurePosixPath("/tmp/install_nushell.sh")

def main():
    logging.info(f"Install in container {containerName}")
    sandbox = docker.Container(containerName)        
    sandbox.exec(script=script)

# Do NOT import this module
main()