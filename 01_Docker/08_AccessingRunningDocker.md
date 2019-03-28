The nsenter tool is part of the util-linux package since version 2.23. It provides access to the namespace of another process. nsenter requires root privileges to work properly. 

    cd /tmp
    curl https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz | tar -zxf-
    cd util-linux-2.24
    ./configure --without-ncurses
    make nsenter
    cp nsenter /usr/local/bin

Get the container id from

    docker ps

get the pid from the container info

    $pid = docker inspect --format "{{ .State.Pid }}" <container-id>

Get into the container

    sudo /usr/local/bin/nsenter --target $pid --mount --uts --ipc --net --pid -- /bin/bash -c "exec -cl /bin/bash"  
    
   [What is namespace and How to enter a Docker container](https://foxutech.com/how-to-enter-a-docker-container/)
