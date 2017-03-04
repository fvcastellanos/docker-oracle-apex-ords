docker-oracle-apex-ords
============================

Oracle Express Edition 11g Release 2 on Ubuntu 14.04.1 LTS with APEX 5.1 and ORDS 3.0.9

# Create our own docker image, with custom password

#### Get the image code from github:

    git clone --depth=1 https://github.com/araczkowski/docker-oracle-apex-ords.git
    cd docker-oracle-apex-ords

#### Building your own image, with custom password:

    docker build -t oracle-apex --build-arg PASSWORD=P@ssw0rd12345 .

#### Run the container based on your own image with 8080, 1521, 22 ports opened:

    export ORACLE_APEX_VOLUME=<path-where-you-want-to-define-your-volume>
    docker run --rm --name -d oracle-apex -v $ORACLE_APEX_VOLUME:/u01:rw -p 127.0.0.1:22:22 -p 127.0.0.1:1521:1521 -p 127.0.0.1:8080:8080 oracle-apex

#### To see what's going on in the container

    docker logs -f oracle-apx

#### Password for SYS & SYSTEM & Tomcat ADMIN & APEX ADMIN:

    P@ssw0rd12345

# Connect to server in container (Option 1. / Option 2.)

##### Connect via ssh to server with following setting:

    ssh root@127.0.0.1 -p 22
    password: P@ssw0rd12345

##### Connect database with following setting:

    hostname: 127.0.0.1
    port: 1521
    sid: xe
    username: system
    password: P@ssw0rd12345

##### Connect to Tomcat Manager with following settings:

    http://127.0.0.1:8080/manager
    user: ADMIN
    password: P@ssw0rd12345

##### Connect to Oracle Application Express web management console via ORDS with following settings:

    http://127.0.0.1:8080/ords/apex
    workspace: INTERNAL
    user: ADMIN
    password: P@ssw0rd12345
