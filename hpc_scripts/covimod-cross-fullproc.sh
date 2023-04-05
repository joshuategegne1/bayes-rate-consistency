#!/bin/sh

#PBS -l walltime=08:00:00
#PBS -l select=1:ncpus=10:ompthreads=1:mem=400gb

REPO_PATH=/rds/general/user/jt1319/home/bayes-rate-consistency
WAVES=5
MODEL="hsgp-eq-lrd-age"
MODEL=${MODEL}-${WAVES}

module load anaconda3/personal
source activate Renv

Rscript $REPO_PATH/scripts/rep-fatigue.R
