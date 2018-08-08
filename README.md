# Guyton72
A reimplementation of the famous Guyton's model from 1972 (Guyton, Arthur C., Thomas G. Coleman, and Harris J. Granger. "Circulation: overall regulation." Annual review of physiology 34.1 (1972): 13-44.)

## fortranSrc
Directory fortranSrc contains the Guyton72 implementation in fortran according to
*On a basic model of circulatory, fluid, and electrolyte regulation in the human system based upon the model of Guyton; White, R. J.*
https://ntrs.nasa.gov/search.jsp?R=19790017554

A fortran compiler is needed to build the model.

#### Linux
Use e.g. GFortran compiler (free):
To build the model, call the following command in the fortranSrc directory
> gfortran Guyton72.f -o Guyton72 -O2

To run the program, call
>./Guyton72

Results are saved in the file Guyton72Results.txt.

#### Windows
We recomend using FTN95 compiler and Plato IDE by SilverFrost (www.silverfrost.com).

## Data
Data directory contains datapoints of the salt loading durinng renal insufficiency from the NASA report to validate our implementation (*SaltLoadingExperiment.csv*). The *\*.kst* files are projects for comparing the data in the [KST tool](https://kst-plot.kde.org/).

## Experiments
Contains data files from the simulation experiments for chosen variables, resampled to adequate readable intervals.

## Scripts
Matlab scripts to run protocols with the Simulink version (*runMe.m*) and resample the fortran output to adequate intervals (*ResampleFortranOutput.m*).

## Simulink
Contains (yet unfinished) fork of the Simulink implementation of the Guyton model by Kofranek et al. (Kofránek, Jirı, and Jan Rusz. "Restoration of Guyton's diagram for regulation of the circulation as a basis for quantitative physiological model development." Physiological research 59.6 (2010): 897.) to the version published in the NASA report.

## *g72 variables.txt* 
contains a list of variable description
