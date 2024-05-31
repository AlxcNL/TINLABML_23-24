#!/usr/bin/env python

# Import
import logging
import numpy as np
import pandas as pd
from pathlib import Path

# Global variables
logging.basicConfig(level=logging.DEBUG)
csvPath = Path.cwd().parent.joinpath('csv')

inputCsvFile ="berniw.f-speedway.5-laps.csv"
outputCsvFile = f"{inputCsvFile[:-4]}_prepared.csv"

actuators = [ "brake", "accel", "steer", "gear" ]
selectedSensors = [
    "time", "pitch", "rpm", "angle", "trackPos", 
    "distRaced", "yaw", "curLapTime", "roll", "pitch", 
    "speedGlobalX", "speedGlobalY", "wheelSpinVel", 
    "speedX", "speedY", "speedZ", 
    "x", "y", "z"
]

logging.info("Data Collection")
logging.info("Read data from {inputCsvFile}")
dfCollected = pd.read_csv(
    csvPath.joinpath(inputCsvFile),
    sep=';', 
    header=0
)

# 188 measurements x 31 features
logging.debug(dfCollected.shape)

logging.info("Data Selection")
logging.info("Remove rows with NaN values for the actuators")
dfSelected = dfCollected.copy().dropna(subset=actuators)
logging.debug(dfSelected.shape)

logging.info("Feature Selection")
dfFeatures = dfSelected.copy()[ selectedSensors ]
logging.debug(dfFeatures.shape)

logging.debug( f"Export dataframe dfFeatures to {outputCsvFile}" )
dfFeatures.to_csv(
    csvPath.joinpath(outputCsvFile),
    sep=',', 
    encoding='utf-8', 
    index=False
)


