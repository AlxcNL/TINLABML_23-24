#!/usr/bin/env python
# Author: J.A.Boogaard@hr.nl

import docker
import logging

# Global configuration

logging.basicConfig(level=logging.INFO)
containerName = "sandbox"

def main():
    logging.info(f"Destroy container {containerName}")
    sandbox = docker.Container(containerName)    
    sandbox.remove()

# Do NOT import this module
main()