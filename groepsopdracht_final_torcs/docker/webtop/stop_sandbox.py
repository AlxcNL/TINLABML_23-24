#!/usr/bin/env python
# Author: J.A.Boogaard@hr.nl

import docker
import logging

# Global configuration

logging.basicConfig(level=logging.INFO)
containerName = "sandbox"

def main():
    logging.info(f"Stop container {containerName}")
    sandbox = docker.Container(containerName)    
    sandbox.stop()

# Do NOT import this module
main()