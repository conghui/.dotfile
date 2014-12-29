###
### Skeleton of a PBS script for submitting sequential or parallel
### jobs on the PSI batch cluster:
###
### https://www.millennium.berkeley.edu/PSI
###
### You MUST edit this skeleton and insert the parameters and commands
### for your program.
###
### PBS is the name of the batch scheduler protocol.  The batch
### scheduler is responsible for assigning jobs to nodes in a cluster.
### It tries to make sure that jobs don't fight for processing
### resources, so that they can get the best performance.  Without a 
### batch scheduler, you can never be sure that some other job might
### interrupt your job on a node.
###
### A PBS script is a standard *nix shell script, with special
### commands for the PBS batch scheduler.  Lines beginning with "#PBS"
### are NOT comments; they are PBS commands.  You can comment them out
### by putting "### " in front of them.
### 
### Once you've written the script, you can submit the job using 
### the qsub command.  See, for example,
###
### http://www.clusterresources.com/wiki/doku.php?id=torque:2.1_job_submission
###
### For example, if your script is called "pbs.sh", run the following:
###
### qsub pbs.sh
###
### Note that the PBS script itself only runs once, on one compute
### node.  It is used to start either a process (which may optionally
### create threads on that node), or to call gexec or mpirun in order
### to start multiple MPI processes (which is only for MPI programs).
###
 
#!/bin/sh
### Set the job name
#PBS -N myprogram
 
### Declare myprogram non-rerunable
#PBS -r n 
 
### Uncomment to disable email notification:
### disable email notification of job status by PBS.
### #PBS -m n  
### Uncomment to send email notification:
### send email on job completion or error
### #PBS -m ae
### #PBS -M your@email.address
 
### Optionally specify destinations for your program's output.
### Specify localhost and an NFS filesystem to prevent file copy errors.
### Without these lines or if the paths are invalid, PBS will redirect 
### stdout and stderr to files in your home directory.
### #PBS -e localhost:/work/username/test.err
### #PBS -o localhost:/work/username/test.log
 
### Optional similar syntax words might work for staging files.
### #PBS -W stagein=/scratch/file.in@localhost:/full/file.in
### #PBS -W stageout=/scratch/file.out@localhost:/full/file.out
 
### Set the queue to "batch", "psi", or "zen".
### psi/batch serves the newer 8-core/48GB and 24-core/256GB nodes
### zen serves the older 3GHz/2-core/3GB and 8-core/16GB nodes
#PBS -q batch
###PBS -q psi
###PBS -q zen
 
### Specify the number of cpus for your job.  This example will run on 16 cpus 
### using 8 nodes with 2 processes per node.  
### You MUST specify some number of nodes or Torque will fail to load balance.
#PBS -l nodes=8:ppn=2
 
### You should tell PBS how much memory you expect your job will use.  mem=1g or mem=1024m
#PBS -l mem=256m
 
### Some portions of some clusters, such as older nodes in the PSI BATCH cluster, 
### support Myrinet GM which is a faster interface for doing internode communication 
### with MPI programs.
### If you want to run your MPI program with GM, you should add one of the following 
### flags (probably just the "gm" flag) to ensure that you are assigned nodes 
### with Myrinet cards:
###
### gm
### gm_pci64b
### gm_pcixd
###
### For example, to run on 4 processes on each of 2 nodes with Myrinet cards you write
### #PBS -l nodes=2:ppn=4:gm
 
### Other options may be available too.  For example, to run on only 3GHz PSI
### nodes, add "cpu3000" to your nodes line.
###
### Valid options are:
### PSI 24-core: cpu2000 nehalem nehalemEx beckton mem256g
### PSI 8-core: cpu2667 nehalem gainestown mem48g
### ZEN 8-core: cpu2333 pe1950 mem16g
### ZEN 2-core: cpu3000 gm gm_pci64b pe1850 mem3g
### #PBS -l nodes=1:ppn=24:cpu2000  # for an exclusive reservation of a 24-core node (PSI cluster)
### #PBS -l nodes=1:ppn=8:cpu2667   # for an exclusive reservation of an 8-core node (PSI cluster)
### #PBS -l nodes=1:ppn=1:cpu2667   # use one core of an 8-core node (PSI cluster)
### #PBS -l nodes=1:ppn=8:cpu2333   # for an exclusive reservation of an 8-core node (ZEN cluster)
### #PBS -l nodes=1:ppn=2:cpu3000   # for an exclusive reservation of a 2-core node (ZEN cluster)
### #PBS -l nodes=8:ppn=2:cpu3000   # for reserving eight 2-core nodes (ZEN cluster)
 
### You can override the default 1 hour real-world time limit and 24-hour CPU-time.  
### Shortening the default CPU-time may improve your chances of running as a back-fill job.
### Check out the current back-fill availability by running /usr/local/maui/bin/showbf on psi.
### or see the tail end of the status page: http://freak.millennium.berkeley.edu/psi/status.html
### -l walltime=HH:MM:SS and -l cput=HH:MM:SS
### Jobs on the public clusters are currently limited to 10 days walltime.
#PBS -l walltime=1:00:00
#PBS -l cput=24:00:00
 
### Switch to the working directory; by default Torque launches processes from your home directory.
### Jobs should only be run from /work; Torque returns results via NFS.
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
 
### Use gexec to run a program on the assigned processors.  $GEXEC_SVRS is automatically defined for you.
gexec -n 0 myprogram
 
### Alternatively, run a parallel MPI executable.
mpirun -v -machinefile $PBS_NODEFILE -np $NPROCS mympiprogram
 
### Or, if you're running on only one node, run your executable directly:
/some/path/to/a/binary
