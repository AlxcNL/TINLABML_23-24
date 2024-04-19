#!/usr/bin/env python
# Author: J.A.Boogaard@hr.nl

from params import *
import logging
from pathlib import Path
import subprocess

logging.basicConfig(level=logging.INFO)

# TODO Use Data Classes?

def listArtifacts(type, all=False, filter=None):
    listCmd = ["image", "list"]
    result = None

    if all:
        listCmd.append("-a")

    listCmd.append(filter)
    logging.debug( f"listCmd : {listCmd}" )

    # docker image list student/sandbox:0.1     
    return Command(listCmd).execute()

def listContainers(all=False, filter=None):
    return listArtifacts("container", all, filter)

def listImages(all=False, filter=None):
    return listArtifacts("image", all, filter)

def listVolumes(all=False, filter=None):
    return listArtifacts("volume", all, filter)


def remove(artifact, name):               
    removeCmd = Properties(
        Property(artifact, "rm"),
        Property(Flag('f'), name), 
    )

    removeCmd = Command(removeCmd.toEnvList())        
    logging.info( f"Remove {artifact} {name}" )
    result = removeCmd.execute()
    logging.info(result)    

class PortMapping(Argument):   
    def __init__(self, hostPort, containerPort):
        super().__init__(hostPort, containerPort, sep=':', flag=Flag('p'))

class VolumeMapping(Argument):   
    def __init__(self, hostDir, containerDir):
        super().__init__(hostDir, containerDir, sep=':', flag=Flag('v'))


class Command(object):
    
    def __init__(self, cmdArgs, captureOutput=True, text=True, check=True):
        self.cmd = ["docker"] + list(cmdArgs)
        self.captureOutput = captureOutput
        self.text = text
        self.check = check

    def execute(self):        
        logging.info(f"Execute { ' '.join(self.cmd) }")
        result = subprocess.run(self.cmd, capture_output=self.captureOutput, text=self.text, check=self.check)
        return result


class Image(object):

    def __init__(self, imageName, dockerFileLocation=None):
        self.name = imageName
        self.dockerFile = str()
        
        if dockerFileLocation is not None:
            self.dockerFile = str(dockerFileLocation.joinpath("Dockerfile"))


    def build(self, buildProperties=None, quiet=False, replace=False):                               
        
        if replace:
            logging.info( f"Check if image {self.name} already exists" )        

            if listImages(all=False, filter=self.name) is not None:
                logging.info(f"Image {self.name} already exist and will be replaced")
                remove("image", self.name)

        buildArguments = Properties(
            Property("image", "build"),
            Property(Flag('t'), self.name)
        )

        if buildProperties is not None:
            buildArguments += buildProperties
        
        if quiet:
            buildArguments.append( Flag('quiet') )

        if len(self.dockerFile) > 0:
            buildArguments.append( Argument(self.dockerFile, '.', sep='', flag=Flag('f')) )
        else:                     
            buildArguments.append( Property(self.dockerFile, '.', sep='') )

        logging.debug( f"buildArguments : {buildArguments}" )

        buildCmd = Command(buildArguments.toEnvList())
        result = buildCmd.execute()
        logging.debug(result)


class Container(object):

    def __init__(self, containerName):
        self.name = containerName

    def create(self, image, createProperties=None, replace=True):

        if replace:
            logging.info( f"Check if container {self.name} already exists" )

            if listContainers(all=True, filter=self.name) is not None:
                logging.info(f"Container {self.name} already exist and will be replaced")
                remove("container", self.name)
              
            createArguments = Properties(
                Property("container", "create"),
                Property( Flag("name"), self.name ), 
            ) 

            if createProperties is not None:
                createArguments += createProperties

            logging.debug( f"createArguments : {createArguments}" )       
        
            createArgumentsList = createArguments.toEnvList()
            createArgumentsList.append(image)
            createCmd = Command( createArgumentsList )
            result = createCmd.execute()
            logging.debug(result)

    def exec(self, script, detach=False):
        
        execArguments = Properties(
            # docker exec -it --detach webtop /bin/bash
            Property("container", "exec", ),
        )

        if detach:
             execArguments.append(Flag("detach"))             

        execArguments.append( Argument( self.name, "/bin/bash", flag=Flag("i") ) )
        execArgumentsList = execArguments.toEnvList()
        execArgumentsList.append( str(script) )
        logging.debug( f"execArgumentsList : {execArgumentsList}" )       
            
        execCmd = Command( execArgumentsList )
        result = execCmd.execute()
        logging.debug(result)

    def stop(self):

        logging.info( f"Check if container {self.name} already exists" )

        if listContainers(all=True, filter=self.name) is not None:

            stopArguments = Properties(
                Property("container", "stop")             
            )

            stopArgumentsList = stopArguments.toEnvList()
            stopArgumentsList.append(self.name)

            stopCmd = Command(stopArgumentsList)
            result = stopCmd.execute()
            logging.debug(result)


    def start(self, startFlags=None):
       
        startArguments = Properties(
            Property("container", "start")             
        )

        startArguments.append(self.name)
        startArgumentsList = startArguments.toEnvList()
        
        if startFlags is not None:
            startArgumentsList += [ str(flag) for flag in startFlags ]


        logging.debug( f"startArgumentsList : {startArgumentsList}" )       
            
        startCmd = Command( startArgumentsList )
        result = startCmd.execute()
        logging.debug(result)

    def remove(self):
        self.stop()
        remove("container", self.name)


# TODO replace by unit tests
def main():
    import logging

    # Set the logging level
    logging.basicConfig(level=logging.INFO)

    imageName = "sandbox"
    imageTag = "0.1"
    baseImageName = "linuxserver/webtop"
    # baseImageTag = "ubuntu-mate
    baseImageTag = "debian-xfce"
    baseImage = f"{baseImageName}:{baseImageTag}"
    targetImage = f"test/{imageName}:{imageTag}"
    containerName = "sandbox"

    buildProperties = Properties(
        Argument( "BASE_IMAGE", baseImage, sep='=', flag=Flag("build-arg") ),
        Argument( "CUSTOM_USER", "student", sep='=', flag=Flag("build-arg") )        
    )
    logging.debug( f"buildProperties : {buildProperties}" )    

    img = Image(targetImage)
    img.build(buildProperties=buildProperties, quiet=False)
    listImages(all=False, filter=imageName)

    createProperties = Properties(
        VolumeMapping( Path('.').absolute(), "/config"),
        PortMapping(3000, 3000),       
    )
    logging.info( f"createProperties : {createProperties}" )    
    container = Container(image=targetImage, container=containerName)
    container.create(createProperties, replace=True)    
    logging.info( f"Container {containerName} exists? { listContainers(all=True, filter='containerName') is not None }" )        

if __name__ == '__main__':    
    main()