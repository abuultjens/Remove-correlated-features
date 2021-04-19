# remove-duplicate-features
Removes duplicate features from .csv matrix using bash

    $ tr ',' '\t' < [INFILE.csv] | sort -k2 | uniq --skip-fields=1 | tr '\t' ',' > [OUTFILE.csv]
    
