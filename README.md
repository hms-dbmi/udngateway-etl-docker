# udngateway-etl-docker

## Building the ETL Image
There is a script included in this code to help you build the ETL image. The image is dependent on downloading the UDN Gateway source code so that the django dataimport commands can be run within the project.

The script runs without parameters, but you will need to ensure that you can clone the develop branch of the udngateway repo as the running user. You will also notice this script manually modifies some aspects of the models to prevent errors introduced by historic migrations. It will also surpress the sending of e-mails when creating certain objects.

The command to run is the following:

**`./build_udngateway_etl.sh`**

## Running the ETL Container
When you run the container a base OS with Python and the UDN Gateway source code will be spun up. The included script will start the image and attempt to run the commands to initialize the database and data for the UDN Gateway.

The script makes the assumption that you have the fixture .json files sitting inside the root directory of this repository. 

It also assumes you have the configuration file for the gateway in the same directory. The format for the database section is the usual django mysql config with the IP obtainer by docker-machine IP and the password you chose when running the DB container.



    ########## DATABASE CONFIGURATION
    # See: https://docs.djangoproject.com/en/dev/ref/settings/#databases
    DATABASES = {
    'default': {
		  ....
        'USER' : 'root',
        'PASSWORD' : 'PASSWORD_FROM_DB_DOCKER',
        'HOST': 'DOCKER_MACHINE_IP',
        'PORT': '3306',
    	}
    }
    ########## END DATABASE CONFIGURATION



All of these files will be copied over to the container and the django migration and data loading will take place.

The command to run:

**`./start_udngateway_etl.sh`**
