#!/usr/bin/env python

# Import
import logging
import numpy as np
import pandas as pd
import sys
from pathlib import Path

# Global variables
logging.basicConfig(level=logging.DEBUG)
sep=';'

csvPath = Path.cwd().parent.joinpath('csv')
csvFilename = sys.argv[1]
inputCsvFile = csvPath.joinpath(csvFilename)
outputCsvFile = f"{csvFilename[:-4]}_prepared.csv"

actuators = [ "a_acceleration", "a_brake", "a_gear", "a_steer", "a_clutch" ]
selectedSensors = [
    "m_client_name", "m_timestamp", 
    "s_speed_x", "s_speed_y", "s_speed_z", 
    "s_rpm", "s_gear", "s_angle", "s_z", 
    "s_damage", "s_track_position", 
    "s_race_position", "s_distance_raced", "s_distance_from_start", 
    "s_current_laptime", "s_last_laptime", 
    "s_plus5_degrees2caraxis", "s_parallel2caraxis", "s_min5_degrees2caraxis"
]

logging.info("Data Collection")
logging.info("Read data from {inputCsvFile}")
dfCollected = pd.read_csv(
    csvPath.joinpath(inputCsvFile),
    sep=sep, 
    header=0
)

# 188 measurements x 31 features
logging.debug(dfCollected.shape)

logging.info("Data Selection")
logging.info("Remove rows with NaN values for the actuators")
dfSelected = dfCollected.copy().dropna(subset=actuators)
logging.debug(dfSelected.shape)

logging.info("Feature Selection")
dfFeatures = dfSelected.copy()[ selectedSensors+actuators ]
logging.debug(dfFeatures.shape)

logging.debug( f"Export dataframe dfFeatures to {outputCsvFile}" )
dfFeatures.to_csv(
    csvPath.joinpath(outputCsvFile),
    sep=sep, 
    encoding='utf-8', 
    index=False
)


