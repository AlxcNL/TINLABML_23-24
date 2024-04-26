#!/usr/bin/env python
# Author: J.A.Boogaard@hr.nl

from pathlib import Path, PurePosixPath
from params import Argument, Flag, Property, Properties
import docker
import logging
import shutil

# Global configuration

logging.basicConfig(level=logging.INFO)

imageName = "sandbox"
imageTag = "0.1"
baseImageName = "linuxserver/webtop"
baseImageTag = "ubuntu-mate"
baseImage = f"{baseImageName}:{baseImageTag}"

scriptPath = PurePosixPath("/tmp")
scripts = [
    "install_tools.sh",
    "upgrade.sh"
]

def readStudentInfo():
    return input("Studentnumber : ")

def createDirs(*dirNames):
    for dirName in dirNames:
        logging.debug(f"Create directory {dirName.absolute()}")
        dirName.mkdir(parents=True, exist_ok=True)

def createDockerImage(targetImage, buildProperties=None):
    img = docker.Image(targetImage)
    img.build(buildProperties=buildProperties, quiet=False, replace=False)
    docker.listImages(filter=imageName)


def main():
    # logging.info("Read studentnumber")

    # studentNumber = "student"
    # # studentNumber = readStudentInfo()   
    # logging.debug(f"studentnumber : {studentNumber}")

    # containerHomeDir = PurePosixPath( f"/home/{studentNumber}" )
    # hostDir = Path(baseImageTag)
    # hostHomeDir = hostDir.joinpath(studentNumber)
    scriptsDir = Path("install")

    # logging.info("Create directories")
    # createDirs(hostDir, hostHomeDir)

    # logging.info("Create cofiguration files")
    # envFile = hostHomeDir.joinpath(".env")

    # shutil.copy(
    #     Path("skel/.bashrc"),
    #     hostHomeDir.joinpath(".bashrc")        
    # )

    # shutil.copy(
    #     Path("skel/.bash_aliases"),
    #     hostHomeDir.joinpath(".bash_aliases")        
    # )

    # targetImage = f"{studentNumber}/{imageName}:{imageTag}"
    # logging.debug(f"targetImage : {targetImage}")
    # logging.info(f"Create image {targetImage} based on {baseImage}")

    # buildProperties = Properties(
    #     Argument( "BASE_IMAGE", baseImage, sep='=', flag=Flag("build-arg") ),
    #     Argument( "CUSTOM_USER", studentNumber, sep='=', flag=Flag("build-arg") )        
    # )
    # logging.debug( f"buildProperties : {buildProperties}" )    
    # createDockerImage(targetImage, buildProperties)

    # Consider the environment
    envProperties = Properties(
        # Property( "CUSTOM_USER", studentNumber, sep='=' ),
        # Property( "FM_HOME", containerHomeDir, sep='='),
        Property( "PUID", 1000, sep='=' ),
        Property( "PGID", 1000, sep='=' ),
        Property( "TZ", "Europe/Amsterdam", sep='=' ),
        Property( "TITLE", "Linux Sandbox Environment", sep='=' )
    )
    
    # logging.debug( f"envProperties envList : {envProperties.toEnvList()}" )    
    # logging.info( f"Create {envFile}" )
    # envProperties.toEnvFile(envFile)

    # NEW
    targetImage = baseImage
    containerName = "sandbox"
    logging.info(f"Create container {containerName} from {targetImage}")
    sandbox = docker.Container(containerName)    

    createProperties = Properties(
        Argument( 3000, 3000, sep=':', flag=Flag('p') ),
        Property("--restart", "unless-stopped"),
        # Property( Flag("env-file"), envFile.absolute()),
        Property( "--shm-size", "2gb", sep='=' ),
        # docker.VolumeMapping( hostHomeDir.absolute(), containerHomeDir ),
        docker.VolumeMapping( scriptsDir.absolute(), scriptPath )
    )        

    sandbox.create(targetImage, createProperties)

    logging.debug(f"Run scrips in container {containerName}")
    sandbox.start()

    # for script in scripts:
    #     logging.info( f"Run {script}" )
    #     sandbox.exec( scriptPath.joinpath(script), detach=False )
    # sandbox.exec( scriptPath.joinpath("setup.sh"), detach=False )

    # sandbox.exec( scriptPath.joinpath(script), detach=False )
    # sandbox.stop()

# Do NOT import this module
main()
