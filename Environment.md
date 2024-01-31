```json
{
    "CA_AUTO_UPDATE": {
        "type": "boolean",
        "default": 0,
        "description": "Auto update CA Certs",
        "containers": "all",
        "usage": {
            "cacerts": {
                "required": true
            }
        }
    },
    "CA_UPDATE_JVM": {
        "type": "boolean",
        "default": 0,
        "description": "Update the JVM",
        "containers": "all",
        "usage": {
            "cacerts": {
                "required": true
            }
        }
    },
    "CERT_UPDATE_KEYS": {
        "type": "boolean",
        "default": 0,
        "description": "Update server cert/key pair and DHE Params",
        "containers": "all",
        "usage": {
            "keys": {
                "required": true
            }
        }
    },
    "CA_UPDATE_OS": {
        "type": "boolean",
        "default": 1,
        "description": "Update the OS Store",
        "containers": "all",
        "usage": {
            "cacerts": {
                "required": true
            }
        }
    },
    "DH_PARAM_SIZE": {
        "type": "integer",
        "default": 2048,
        "description": "DH Size to generate",
        "containers": "all",
        "usage": {
            "dhparams": {
                "required": true
            }
        }
    },
    "OCIE_CONFIG": {
        "type": "path",
        "default": "${OCIE_LIB}/types",
        "description": "Path where config.ocie lives",
        "containers": "all",
        "usage": {
            "ociectl": {
                "required": true
            }
        }
    },
    "CA_PATH": {
        "type": "path:single",
        "default": "",
        "description": "Path to where CA Certs are, must have .crt extension",
        "containers": "all",
        "usage": {
            "cacerts": {
                "required": true
            }
        }
    },
    "CERT_PATH": {
        "type": "path:single",
        "default": "/etc/ssl",
        "description": "Path to where keypair should be store",
        "containers": "all",
        "usage": {
            "keys": {
                "required": false
            }
        }
    },
    "CA_FILTER": {
        "type": "string",
        "default": "*_CA.crt",
        "description": "Filter to apply onto CA_PATH",
        "containers": "all",
        "usage": {
            "cacerts": {
                "required": true
            }
        }
    },
    "CERT_SUBJECT": {
        "type": "string",
        "default": "localhost",
        "description": "Subject of certificate",
        "containers": "all",
        "usage": {
            "keys": {
                "required": false
            }
        }
    },
    "OCIE_BIN": {
        "type": "system",
        "default": "/usr/sbin",
        "description": "Ocie Bin Files",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": true
            }
        }
    },
    "OCIE_HOME": {
        "type": "system",
        "default": "/etc/ocie",
        "description": "Ocie Home",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": true
            }
        }
    },
    "OCIE_LIB": {
        "type": "system",
        "default": "/usr/lib/ocie",
        "description": "Path to Ocie Scripts",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": true
            }
        }
    },
    "OS_BASE": {
        "type": "system",
        "default": "${OS_BASE}",
        "description": "Image version e.g 22.04",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": false
            }
        }
    },
    "OS_CODENAME": {
        "type": "system",
        "default": "${OS_CODENAME}",
        "description": "Codename of image e.g 'jammy'",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": true
            }
        }
    },
    "OS_IMAGE": {
        "type": "system",
        "default": "${OS_IMAGE}",
        "description": "Image FQDN e.g ubuntu:22.04",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": false
            }
        }
    },
    "OS_TIMEZONE": {
        "type": "system",
        "default": "${OS_TIMEZONE}",
        "description": "System Timezone",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": false
            }
        }
    },
    "OS_VERSION": {
        "type": "system",
        "default": "${OS_VERSION}",
        "description": "Version without dot notation e.g 2204",
        "containers": "all",
        "usage": {
            "self": {
                "required": true
            },
            "children": {
                "required": true
            }
        }
    },
    "APP_UPDATE_AUTO": {
        "type": "boolean",
        "default": 1,
        "description": "Auto update app from APP_UPDATE_PATH",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APP_UPDATE_FAIL": {
        "type": "boolean",
        "default": 0,
        "description": "If app cannot update, should we fail to start",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "ENABLE_CORS": {
        "type": "boolean",
        "default": 0,
        "description": "Enable CORS Headers",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "ENABLE_XFRAME": {
        "type": "boolean",
        "default": 0,
        "description": "Enable Xframe  Headers",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "REWRITE_CORS": {
        "type": "boolean",
        "default": 0,
        "description": "Rewrite cors headers",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "REWRITE_DEFAULT": {
        "type": "boolean",
        "default": 0,
        "description": "Use default rules, http to https",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "REWRITE_ENABLED": {
        "type": "boolean",
        "default": 0,
        "description": "Activate rewrite rules from config",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APACHE_CONF": {
        "type": "path:single",
        "default": "/etc/apache2/conf-include",
        "description": "Include additional config files",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APACHE_LOG": {
        "type": "path:single",
        "default": "/var/log/apache2",
        "description": "Path where apache should write logs",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APACHE_MODS": {
        "type": "path:single",
        "default": "/etc/apache2/mods-include",
        "description": "Include additional mod files",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APACHE_SITES": {
        "type": "path:single",
        "default": "/etc/apache2/sites-enabled",
        "description": "Path to site definitions",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APP_CACHE": {
        "type": "path:single",
        "default": "/var/cache",
        "description": "Path to store cache",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APP_DATA": {
        "type": "path:single",
        "default": "/var/www/data",
        "description": "Path where the app should write data",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APP_UPDATE_PATH": {
        "type": "path:single",
        "default": "",
        "description": "Path to where app updates are stored",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APP_GROUP": {
        "type": "string",
        "default": "www-data",
        "description": "Owner, uid",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "APP_NAME": {
        "type": "string",
        "default": "",
        "description": "App name",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": true
            },
            "ociectl": {
                "required": true
            }
        }
    },
    "APP_OWNER": {
        "type": "string",
        "default": "www-data",
        "description": "Group, gid",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": true
            },
            "ociectl": {
                "required": true
            }
        }
    },
    "APP_TYPE": {
        "type": "string",
        "default": "apache2",
        "description": "Ocie app type definition",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": true
            },
            "ociectl": {
                "required": true
            }
        }
    },
    "REWRITE_EXCLUDE": {
        "type": "string",
        "default": "",
        "description": "Exclude from rewrite rules, regex/pattern",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "REWRITE_EXT": {
        "type": "string",
        "default": "",
        "description": "Rewrite file extensions",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "REWRITE_INDEX": {
        "type": "string",
        "default": "",
        "description": "Set framework rewrite e.g index.php",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "VADC_IP_ADDRESS": {
        "type": "string",
        "default": "10.0.0.0/8 172.16.0.0/12 192.168.0.0/16",
        "description": "Use address rules, http to https",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "VADC_IP_HEADER": {
        "type": "string",
        "default": "X-Forwarded-For",
        "description": "Path va vadc ip hea",
        "containers": "apache2:firefly:walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "CATALINA_HOME": {
        "type": "path:single",
        "default": "/opt/tomcat",
        "description": "Path to tomcat base",
        "containers": "firefly",
        "usage": {
            "build-arg": {
                "required": true
            },
            "ociectl": {
                "required": true
            }
        }
    },
    "JAVA_HOME": {
        "type": "path:single",
        "default": "/opt/java",
        "description": "Path to java base",
        "containers": "firefly",
        "usage": {
            "build-arg": {
                "required": true
            },
            "ociectl": {
                "required": true
            }
        }
    },
    "APP_PARAMS": {
        "type": "string",
        "default": "",
        "description": "Additional params to pass",
        "containers": "firefly",
        "usage": {
            "ociectl": {
                "required": true
            }
        }
    },
    "LD_LIBRARY_PATH": {
        "type": "system",
        "default": "${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$TOMCAT_NATIVE_LIBDIR",
        "description": "Path to tomcat native lib",
        "containers": "firefly",
        "usage": {
            "build-arg": {
                "required": true
            }
        }
    },
    "TOMCAT_NATIVE_LIBDIR": {
        "type": "system",
        "default": "${CATALINA_HOME}/native-jni-lib",
        "description": "Path to tomcat native lib",
        "containers": "firefly",
        "usage": {
            "build-arg": {
                "required": true
            }
        }
    },
    "TOMCAT_VERSION": {
        "type": "system",
        "default": "${TOMCAT_VERSION}",
        "description": "Tomcat Version",
        "containers": "firefly",
        "usage": {
            "build-arg": {
                "required": true
            }
        }
    },
    "INTERNAL_DOMAIN": {
        "type": "string",
        "default": "",
        "description": "Internal domain e.g example.local to be replaced in mail header",
        "containers": "mantis",
        "usage": {
            "ociectl": {
                "required": true
            }
        }
    },
    "MAIL_DOMAIN": {
        "type": "string",
        "default": "",
        "description": "Domain e.g example.com",
        "containers": "mantis",
        "usage": {
            "ociectl": {
                "required": true
            }
        }
    },
    "RELAY_CLIENTS": {
        "type": "string",
        "default": "127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128",
        "description": "Space seperated list of ip address allowed to relay",
        "containers": "mantis",
        "usage": {
            "ociectl": {
                "required": true
            }
        }
    },
    "RELAY_HOST": {
        "type": "string",
        "default": "",
        "description": "The host where postfix should relay through e.g smtp.gmail.com",
        "containers": "mantis",
        "usage": {
            "ociectl": {
                "required": true
            }
        }
    },
    "PHP_MAX_EXECUTION_TIME": {
        "type": "integer",
        "default": 60,
        "description": "PHP Max Execution time",
        "containers": "walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "PHP_MAX_INPUT_TIME": {
        "type": "integer",
        "default": 60,
        "description": "PHP Max Input time",
        "containers": "walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "PHP_ERROR_LOG": {
        "type": "string",
        "default": "${APACHE_LOG}/php_error.log",
        "description": "PHP Error log file",
        "containers": "walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "PHP_MEMORY_LIMIT": {
        "type": "string",
        "default": "128M",
        "description": "PHP Memory limit",
        "containers": "walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "PHP_POST_MAX_SIZE": {
        "type": "string",
        "default": "8M",
        "description": "PHP Post Max size",
        "containers": "walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "PHP_TIMEZONE": {
        "type": "string",
        "default": "${OS_TIMEZONE}",
        "description": "PHP Timezone",
        "containers": "walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "PHP_UPLOAD_MAX_FILESIZE": {
        "type": "string",
        "default": "8M",
        "description": "PHP Upload Max filesize",
        "containers": "walrus",
        "usage": {
            "config": {
                "required": false
            }
        }
    },
    "PHP_VERSION": {
        "type": "string",
        "default": "${PHP_VERSION}",
        "description": "PHP Version",
        "containers": "walrus",
        "usage": {
            "build-arg": {
                "required": true
            }
        }
    },
    "SQL_VERSION": {
        "type": "string",
        "default": "${SQL_VERSION}",
        "description": "SQL Driver Version",
        "containers": "walrus",
        "usage": {
            "build-arg": {
                "required": true
            }
        }
    }
}
```
