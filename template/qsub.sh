#!/bin/sh

### Set the job name
#PBS -N youJobName
 
### Declare myprogram non-rerunable
#PBS -r n 
 
### send email on job completion or error
#PBS -m ae
### #PBS -M your@email.address
 
### Optionally specify destinations for your program's output.
### #PBS -e esfwi.err
### #PBS -o esfwi.log
 
### Set the queue to "batch", "psi", or "zen".
### psi/batch serves the newer 8-core/48GB and 24-core/256GB nodes
### zen serves the older 3GHz/2-core/3GB and 8-core/16GB nodes
#PBS -q batch
 
### the number nodes you want to use and number of processes per node
#PBS -l nodes=1:ppn=8
 
### maximum of wall time and cpu time
#PBS -l walltime=9999:00:00
#PBS -l cput=9999:00:00
 
### source the file that setup your environment variables
source ~/.vars.sh

### Switch to the working directory; by default Torque launches processes from your home directory.
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR
 
### Run some informational commands.
echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`
echo This jobs runs on the following processors:
echo `cat $PBS_NODEFILE`
 
### Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS cpus
 
### Alternatively, run a parallel MPI executable.
#mpirun -v -machinefile $PBS_NODEFILE -np $NPROCS mympiprogram
./fm par=param.conf
 
