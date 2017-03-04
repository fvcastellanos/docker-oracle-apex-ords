docker-oracle-apex-ords
============================

Oracle Express Edition 11g Release 2 on Ubuntu 14.04.1 LTS with APEX 5.1 and ORDS 3.0.9

# Create our own docker image

#### Get the image code from github:

    git clone --depth=1 https://github.com/araczkowski/docker-oracle-apex-ords.git
    cd docker-oracle-apex-ords

#### Building your own image:

    docker build -t oracle-apex --build-arg PASSWORD=secret .

#### Run the container based on your own image with 8080, 1521, 22 ports opened:

    export ORACLE_APEX_VOLUME=$(pwd)
    docker run --rm -d --name oracle-apex -v $ORACLE_APEX_VOLUME/volume:/u01:rw -p 127.0.0.1:22:22 -p 127.0.0.1:1521:1521 -p 127.0.0.1:8080:8080 oracle-apex

#### To see what's going on in the container

    docker logs -f oracle-apex

#### Password for SYS & SYSTEM & Tomcat ADMIN & APEX ADMIN:

    secret

# Connect to server in container

##### Connect via ssh to server with following setting:

    ssh root@127.0.0.1 -p 22
    password: secret

##### Connect database with following setting:

    hostname: 127.0.0.1
    port: 1521
    sid: xe
    username: system
    password: secret

##### Connect to Tomcat Manager with following settings:

    http://127.0.0.1:8080/manager
    user: ADMIN
    password: secret

##### Connect to Oracle Application Express web management console via ORDS with following settings:

    http://127.0.0.1:8080/ords/apex
    workspace: INTERNAL
    user: ADMIN
    password: secret
