#Grab ETL Code
rm -Rf udngateway
git clone https://github.com/hms-dbmi/udngateway.git

sed -i -e 's/migrations.RunPython(addsimpleid),/# migrations.RunPython(addsimpleid),/g' udngateway/udngateway/application/migrations/0001_squashed_0042_auto_20151016_1206.py
sed -i -e 's/migrations.RunPython(fillinprev),/# migrations.RunPython(fillinprev),/g' udngateway/udngateway/login/migrations/0005_fillinethnic.py

docker build -t dbmi/udngateway-etl-docker ./