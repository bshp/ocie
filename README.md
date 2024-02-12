#### Docker Ocie Image  
Base image we use for our containers, Ocie itself is just a helper utility.    
Default shell for Ubuntu is /bin/dash, this image sets /bin/sh to /bin/bash
    
Note: no support provided, released on github for automated builds and registry publishing :D
    
#### Includes:    
'ocie' - makes it simple to setup a container without a ton of lines in a Dockerfile    
'ociectl' - run/start/stop/reload the application without having to write entrypoint scripts, a standardized entrpoint for all your containers, e.g 
````
ENTRYPOINT ["/usr/sbin/ociectl", "--run"]
````
Info:    
[https://github.com/bshp/ocie/tree/main/src](https://github.com/bshp/ocie/tree/main/src)
    
#### Base OS:    
Ubuntu Server LTS
    
#### Packages:    
Updated weekly from the official upstream Ubuntu LTS image, OS and Packages
    
Ocie keeps an updated package manifest in json format, under ``/etc/ocie/package_manifest.json``
    
````
ca-certificates 
curl 
gnupg 
jq 
openssl 
tzdata 
unzip 
wget
zip
````
    
#### Tags
[Docker Hub](https://hub.docker.com/r/bshp/ocie/tags)
    
#### Build Args
OS_VERSION: - https://hub.docker.com/_/ubuntu/tags    
TZ: - https://manpages.ubuntu.com/manpages/man3/DateTime::TimeZone::Catalog.3pm.html    
    
#### Required Args
````
--build-arg OS_VERSION
````
#### Build
Always use --pull so that it gets updated
````
docker build . --pull --build-arg OS_VERSION=22.04 --tag YOUR_TAG --no-cache
````
