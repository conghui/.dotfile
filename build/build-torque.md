This guide is aim for installing torque on CentOS. 

Dependencies and packages installation
===
The following packages should be installed:

    sudo yum install -y make libxml2-devel openssl-devel gcc gcc-c++ 

Please make sure that your hostname should be pointed by only *one* ip 
address. For example

    127.0.0.1 conghui.panding.com
    ::1       conghui.panding.com

The above setting in `/etc/hosts` in valid. However, the following is 
invalid.

    192.168.1.1 conghui.panding.com
    127.0.0.1   conghui.panding.com
    ::1         conghui.panding.com

Because more than one ip address pointing to `conhui.panding.com`. If that 
happens, you may revise `/etc/hosts` to figure out which ip address is the 
one that should really map to the domain.

Config and install
===
Normally, I would install torque in a seperate folder:

    INSTALL_ROOT=/usr/local/
    packageName=${PWD##*/}
    prefix=${INSTALL_ROOT}/${packageName}
    serverHome=/var/spool/torque

    ./configure --prefix=${prefix} --with-server-home=${serverHome} && \
      make -j12 && \
      sudo make install

    # create the soft link
    linkName=${packageName%%-*}
    ( cd ${INSTALL_ROOT}; \
      sudo rm -f ${linkName}; \
      sudo ln -s ${packageName} ${linkName}; \
    )

Update PATH
===
In order to expose torque to all users. It is suggested to export the path 
in /etc/profile

    sudo bash -c "echo export PATH=${prefix}/bin:\$\{PATH\} >> /etc/profile"
    sudo bash -c "echo export PATH=${prefix}/sbin:\$\{PATH\} >> /etc/profile"

please source `/etc/profile` to re-login after updating the file.

trqauthd
===
It is assumed that you are still at the source folder where you execute 
`make` command:

    sudo cp contrib/init.d/trqauthd /etc/init.d/
    sudo chkconfig --add trqauthd
    sudo bash -c "echo ${prefix}/lib > /etc/ld.so.conf.d/torque.conf"
    sudo ldconfig
    sudo service trqauthd start


Set up server name
===
Populate the /var/spool/torque/server_name file with the hostname of the 
pbs_server. In this guide, I only want to setup the local host as the 
server as well as the client. Once again, please make sure that hostname 
return by `hostname` is pointed by only one ip address in `/etc/hosts`

    sudo bash -c "echo `hostname` > /var/spool/torque/server_name"

Run torque.setup script
===
We are still at the source directory, and ready to run `torque.setup` 
script. Before running this script. Make sure that you have update the path 
already.

    ./torque.setup root

If command not found error is return, please su to root instead of sudo and
then execute the command again.

config server_priv and mom_priv
===
Add nodes to the /var/spool/torque/server_priv/nodes file. As an example, a 
single node with two processors could be specified with `mgtnode np=2`.

    sudo bash -c "echo `hostname` np=8 > /var/spool/torque/server_priv/nodes"
    sudo bash -c "echo pbs_server = `hostname` > /var/spool/torque/mom_priv/config"

auto start while rebooting
===

    sudo cp contrib/init.d/pbs_server contrib/init.d/pbs_mom \
          contrib/init.d/pbs_sched /etc/init.d
    sudo chkconfig --add pbs_server
    sudo chkconfig --add pbs_mom
    sudo chkconfig --add pbs_sched
    sudo chkconfig pbs_mom on
    sudo chkconfig pbs_server on
    sudo chkconfig pbs_sched on
    sudo service pbs_server restart
    sudo service pbs_mom start
    sudo service pbs_sched start

Try and watch logs
===
After the above configuration, you can go to a directory where you can 
write and execute command `echo "date" | qsub`. If everything works fine, 
you will get two files: `STDIN.o0 STDIN.e0` in your current directory. If 
those two files doesn't appear, please watch the logs. They are located in 
`/var/spool/torque/sched_logs/`, `/var/spool/torque/mom_logs/` and 
`/var/spool/torque/sched_logs/`. Once again, please check the 
`/var/spool/torque/server_name`, `/var/spool/torque/server_priv/nodes`, 
`/var/spool/torque/mom_priv/config`, and your `/etc/hosts`.
