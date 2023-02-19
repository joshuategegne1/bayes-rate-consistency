#!/bin/sh

#PBS -l walltime=06:00:00
#PBS -l select=1:ncpus=10:mem=100gb

REPO_PATH=/rds/general/user/jt1319/home/bayes-rate-consistency
MODEL="hsgp-eq-lrd-age"
WAVES=5
MIXING=TRUE
PPC=TRUE
PLOT=TRUE

module load anaconda3/personal
source activate Renv

MODEL=${MODEL}-${WAVES}

Rscript $REPO_PATH/scripts/postprocess.R --model $MODEL --mixing $MIXING --ppc $PPC --plot $PLOT
