#!/bin/sh

#PBS -l walltime=12:00:00
#PBS -l select=1:ncpus=10:ompthreads=1:mem=100gb
#PBS -m bea

REPO_PATH=/rds/general/user/jt1319/home/bayes-rate-consistency
MODEL="hsgp-eq-lrd"
WAVES=5
HSGP_C=1.5
HSGP_M1=30
HSGP_M2=30

# HMC Sampler params
CHAINS=8
WARMUP=25
SAMPLING=75

module load anaconda3/personal
source activate Renv

Rscript $REPO_PATH/scripts/run-stan.R --waves $WAVES --model $MODEL --hsgp_c $HSGP_C --hsgp_m1 $HSGP_M1 --hsgp_m2 $HSGP_M2


