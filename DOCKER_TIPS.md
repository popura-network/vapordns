vapordns in containers
======================

Build the image from source:

    docker build -t vapordns .

Run with a default config:

    docker run -dt --name=vapordns --restart=unless-stopped --ip=172.17.0.2 --ip6=300:49df:7fbd:1987::100 vapordns 

Run with a custom config and a custom zone file:
    
    docker run -it -v /home/user/CustomConfig:/Corefile -v /home/user/custom.zonefile:/custom.zonefile vapordns

