#### Ocie Types  
To utilize ociectl, create a new config.ocie definition in your container somewhere using the functions below.    
Customize the definition however you want, then set the environment OCIE_CONFIG=/etc/myapp/path_to_definition    
#### Required
````
#!/bin/bash
    
function app_shutdown()
{
    /path/to/your/app --stop
}
    
function app_reload()
{
    /path/to/your/app --reload
}
    
# This must return, e.g echo the process id (PID) if WATCHER_ENABLED=1
function app_start()
{
   /path/to/your/app --start
}
````
    
#### Optional
````
function app_certs()
{
    ${OCIE_LIB}/cacerts;
}
    
function app_config()
{
    ${OCIE_LIB}/config;
}
    
function app_deploy()
{
    ${OCIE_LIB}/deploy;
}
    
function app_test()
{
    echo $(/some/app/run checkcfg)
}
````
    
