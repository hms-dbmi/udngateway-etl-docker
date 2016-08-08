#Grab ETL Code
rm -Rf udngateway
git clone -b develop https://github.com/hms-dbmi/udngateway.git

sed -i -e 's/migrations.RunPython(addsimpleid),/# migrations.RunPython(addsimpleid),/g' udngateway/udngateway/application/migrations/0001_squashed_0042_auto_20151016_1206.py
sed -i -e 's/migrations.RunPython(fillinprev),/# migrations.RunPython(fillinprev),/g' udngateway/udngateway/login/migrations/0005_fillinethnic.py

sed -i -e 's/msg.send()/# msg.send()/g' udngateway/udngateway/login/views.py
sed -i -e 's/msg.attach_alternative/# msg.attach_alternative/g' udngateway/udngateway/login/views.py
sed -i -e 's/msg = EmailMultiAlternatives/# msg = EmailMultiAlternatives/g' udngateway/udngateway/login/views.py
sed -i -e 's/if sendemail:/# if sendemail:/g' udngateway/udngateway/login/views.py

sed -i -e 's/post_save.connect(handle_sample_changed, sender=Sample)/# post_save.connect(handle_sample_changed, sender=Sample)/g' udngateway/udngateway/biorepo/models.py


docker build -t dbmi/udngateway-etl-docker ./