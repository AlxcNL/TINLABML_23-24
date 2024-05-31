#!/usr/bin/env python

# Import
import logging
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from pathlib import Path

# Global variables
logging.basicConfig(level=logging.DEBUG)
csvPath = Path.cwd().parent.joinpath('csv')

inputCsvFile ="berniw.f-speedway.5-laps_prepared.csv"
logging.info("Read data from {csvFile}")
dfCollected = pd.read_csv(
    csvPath.joinpath(inputCsvFile),
    sep=';', 
    header=0
)

# 187 measurements x 19 features 
logging.debug(dfCollected.shape)

logging.info("Split dataset")
# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)
