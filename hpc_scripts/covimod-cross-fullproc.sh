#!/bin/sh

#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=10:ompthreads=1:mem=100gb

REPO_PATH=/rds/general/user/jt1319/home/bayes-rate-consistency
WAVES=5

module load anaconda3/personal
source activate Renv

Rscript $REPO_PATH/scripts/loo-compare.R --waves $WAVES
