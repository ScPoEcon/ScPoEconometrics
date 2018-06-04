#!/bin/sh

Rscript -e 'install.packages(c("tidyverse", "reshape2","Ecdat","learnr","plot3D","mvtnorm","datasauRus"))'
Rscript -e 'if (!all(c("tidyverse", "reshape2","Ecdat","learnr","plot3D","mvtnorm","datasauRus") %in% installed.packages())) { q(status = 1, save = "no")}'
