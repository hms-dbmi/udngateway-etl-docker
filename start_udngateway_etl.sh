docker stop udngateway-etl
docker rm udngateway-etl

docker run -d --name udngateway-etl dbmi/udngateway-etl-docker tail -f /dev/null

docker cp local_dev_new.py udngateway-etl:/opt/udngateway/udngateway/udngateway/settings/local_dev_new.py

docker exec udngateway-etl /bin/sh -c 'mkdir -p /opt/udngateway/udngateway/login/fixtures/'
docker exec udngateway-etl /bin/sh -c 'mkdir -p /opt/udngateway/udngateway/application/fixtures/'
docker exec udngateway-etl /bin/sh -c 'mkdir -p /opt/udngateway/udngateway/patient/fixtures/'
docker exec udngateway-etl /bin/sh -c 'mkdir -p /opt/udngateway/udngateway/photos/fixtures/'
docker exec udngateway-etl /bin/sh -c 'mkdir -p /opt/udngateway/udngateway/survey/fixtures/'
docker exec udngateway-etl /bin/sh -c 'mkdir -p /opt/udngateway/udngateway/biorepo/fixtures/'

docker cp login.json udngateway-etl:/opt/udngateway/udngateway/login/fixtures/
docker cp address.json udngateway-etl:/opt/udngateway/udngateway/application/fixtures/
docker cp application.json udngateway-etl:/opt/udngateway/udngateway/application/fixtures/
docker cp patient.json udngateway-etl:/opt/udngateway/udngateway/patient/fixtures/
docker cp photos.json udngateway-etl:/opt/udngateway/udngateway/photos/fixtures/
docker cp survey.json udngateway-etl:/opt/udngateway/udngateway/survey/fixtures/
docker cp biorepo.json udngateway-etl:/opt/udngateway/udngateway/biorepo/fixtures/
docker cp zips.json udngateway-etl:/opt/udngateway/udngateway/login/fixtures/
docker cp populate.json udngateway-etl:/opt/udngateway/udngateway/login/fixtures/

docker exec udngateway-etl /bin/sh -c 'cd /opt/udngateway/udngateway/; python manage.py migrate --settings udngateway.settings.local_dev_new'
docker exec udngateway-etl /bin/sh -c 'cd /opt/udngateway/udngateway/; python manage.py loaddata populate zips login.json address.json application.json patient.json photos.json survey.json biorepo.json --settings udngateway.settings.local_dev_new'

#docker exec -i -t udngateway-etl /bin/bash
