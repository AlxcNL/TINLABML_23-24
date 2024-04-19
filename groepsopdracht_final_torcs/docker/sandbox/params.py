#!/usr/bin/env python
# Author: J.A.Boogaard@hr.nl

import logging
from pathlib import Path

# Set the logging level
logging.basicConfig(level=logging.INFO)

class Flag(object):
    
    def __init__(self, key):
        self.key = key
        self.dash = '-'

        if len(key)>2:
            self.dash += '-'

    def __str__(self):        
        return f"{self.dash}{self.key}"


class Property(dict):
    
    def __init__(self, key, val, sep=' ',):
        super().__init__({key: val})
        
        self.sep = sep

    def __str__(self):
        (key, val) = self.copy().popitem()     
        return f"{key}{self.sep}{val}"


class Argument(Property):

    def __init__(self, key, val, sep=' ', flag=None):
        super().__init__(key, val, sep=sep)
        
        if flag is not None:
            self.flag = flag
                        
    def __str__(self):
        (key, val) = self.copy().popitem()     
        return f"{self.flag} {key}{self.sep}{val}".lstrip()       


class Properties(list):

    def __init__(self, *args):
        for arg in args:
            self.append(arg)
        
    def toEnvFile(self, envFilePath):

        with open(envFilePath, "w") as envFile:

            for p in self:
                envFile.write(f"{p}\n")

    def __add__(self, other):
        mergedList = [*self, *other]
        return Properties(*mergedList)

    def __str__(self):
        line = str()

        for p in self:
            line += f"{p} "

        return line.rstrip()

    def toEnvList(self):
        return str(self).split(' ')


def main():

    envProperties = Properties(
        Property("CUSTOM_USER", "student", sep='='),
        Property( "TITLE", "Linux Sandbox Environment", sep='=' ),
    )
    
    containerHomeDir = Path('.')
    envFile = containerHomeDir.joinpath(".env").as_posix()
    envProperties.toEnvFile(envFile)

    img = Argument( "BASE_IMAGE", "linuxserver/webtop:debian-xfce", sep='=', flag=Flag("build-arg") )
    port = Argument( 3000, 3000, sep=':', flag=Flag('p') )
    vol0 = Argument( "/path/to/data", "/config", sep=':', flag=Flag('v') )
    buildProperties = Properties(img, port, vol0)
    logging.info( f"buildProperties : {buildProperties}" )      
    logging.info( f"buildProperties envList: {buildProperties.toEnvList()}\n" )    

    runProperties = Properties(
        Argument( 3000, 3000, sep=':', flag=Flag('p') ),
        Property( Flag("restart"), "unless-stopped", sep=' ' ),
        Argument( "/path/to/data", "/config", sep=':', flag=Flag('v') ),
        Property( Flag("shm-size"), "2gb", sep=':' ),        
        Property( Flag("env-file"), envFile)
    )      
    logging.info( f"runProperties : {runProperties}" )    
    logging.info( f"runProperties envList: {runProperties.toEnvList()}\n" )    
    
    flag = Flag("rm")
    logging.info( f"flag : {flag}\n" )

    aProperties = Properties( Property('A', 'a') )
    bProperties = Properties( Property('B', 'b') )
    logging.info( f"aProperties + bProperties = { (aProperties + bProperties) }" )
    logging.info( f"aProperties + bProperties envList = { (aProperties + bProperties).toEnvList() }\n" )

    aProperties.append( Property('C', 'c') )
    logging.info( f"append 'c' to aproperties {aProperties}" ) 
    logging.info( f"append 'c' to aproperties envList {aProperties.toEnvList()}\n" )     

if __name__ == "__main__":
    main()