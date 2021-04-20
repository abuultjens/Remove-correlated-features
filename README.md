# remove-duplicate-features
Removes duplicate features from .csv matrix using bash

    $ head -1 [INFILE.csv] > [OUTFILE.csv]
    $ tr ',' '\t' < [INFILE.csv] | sort -k2 | uniq --skip-fields=1 | tr '\t' ',' > [OUTFILE.csv]
    
