#!/bin/sh

#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=6:ompthreads=1:mem=64gb

REPO_PATH=/rds/general/user/jt1319/home/bayes-rate-consistency
WAVES=5
MODEL="hsgp-eq-lrd-age"
HSGP_C=1.5
HSGP_M1=30
HSGP_M2=30

# HMC Sampler params
CHAINS=4
WARMUP=150
SAMPLING=450

module load anaconda3/personal
source activate Renv

Rscript $REPO_PATH/scripts/run-stan.R --waves $WAVES --model $MODEL --hsgp_c $HSGP_C --hsgp_m1 $HSGP_M1 --hsgp_m2 $HSGP_M2 --chains $CHAINS --iter_warmup $WARMUP --iter_sampling $SAMPLING

MODEL=${MODEL}-${WAVES}
Rscript $REPO_PATH/scripts/postprocess.R --model $MODEL
