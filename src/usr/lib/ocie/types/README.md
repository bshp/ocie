#### Ocie Types  
To utilize ociectl, create a new config.ocie definition in your container somewhere using the functions below.    
Customize the definition however you want, then set the environment OCIE_TYPES=${OCIE_TYPES}:/etc/myapp/path_to_definition    
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
    
function app_update()
{
    ${OCIE_LIB}/update;
}
    
function app_test()
{
    echo $(/some/app/run checkcfg)
}
````
    
