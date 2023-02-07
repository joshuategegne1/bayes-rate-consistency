#!/bin/sh

#PBS -l walltime=23:59:59
#PBS -l select=1:ncpus=8:mem=64gb

REPO_PATH=/rds/general/user/jt1319/home/bayes-rate-consistency
MODEL="hsgp-eq-lrd"
WAVES=5
MIXING=TRUE
PPC=TRUE
PLOT=TRUE

module load anaconda3/personal
source activate Renv

MODEL=${MODEL}-${WAVES}

Rscript $REPO_PATH/scripts/postprocess.R --model $MODEL --mixing $MIXING --ppc $PPC --plot $PLOT
