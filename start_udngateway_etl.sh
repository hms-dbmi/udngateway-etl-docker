docker stop udngateway-etl
docker rm udngateway-etl

docker run -d --name udngateway-etl dbmi/udngateway-etl-docker tail -f /dev/null

docker cp local_dev_new.py udngateway-etl:/opt/udngateway/udngateway/udngateway/settings/local_dev_new.py

docker exec udngateway-etl /bin/sh -c 'cd /opt/udngateway/udngateway/; python manage.py migrate --settings udngateway.settings.local_dev_new'
docker exec udngateway-etl /bin/sh -c 'cd /opt/udngateway/udngateway/; python manage.py loaddata populate --settings udngateway.settings.local_dev_new'
docker exec udngateway-etl /bin/sh -c 'cd /opt/udngateway/udngateway/; python manage.py loaddata zips --settings udngateway.settings.local_dev_new'

#docker exec -i -t udngateway-etl /bin/bash
