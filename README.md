# remove-duplicate-features
Removes duplicate features from .csv matrix using parallel bash

    $ remove-duplicate-features.sh [INFILE] [OUTFILE]
    
    $ cat test.csv 
    INDEX,T1,T2,T3,T4
    I1,0,0,0,0
    I2,0,0,0,0
    I3,1,1,1,1
    I4,1,0,1,0
    I5,1,0,1,0
    
    $ sh remove-duplicate-features.sh test.csv no-dup.csv
    
    $ cat no-dup.csv
    INDEX,T1,T2,T3,T4
    I1,0,0,0,0
    I4,1,0,1,0
    I3,1,1,1,1
    
    
