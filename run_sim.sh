#!/bin/bash
#SBATCH --comment="Run abp simulation w N=10000,L=114,print.stepsxl"
#SBATCH --job-name="abp_sim"
#SBATCH --mail-type=FAIL
#SBATCH --output="/home2/aandr/mips/messages/%j.out"
#SBATCH --error="/home2/aandr/mips/messages/%j.err"
#SBATCH --mail-user=aandr@sas.upenn.edu
#SBATCH --partition=compute
#SBATCH --mem=1G
#SBATCH --time="1-00:00:00"

dir_marmalade='/home2/aandr'
cd $dir_marmalade

/home2/aandr/lammps-29Sep2021/build/lmp -in /home2/aandr/mips/in.sql2
exit_code=$?
exit $exit_code
