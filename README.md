# openshift4-infra


**AWS APPLIER:**


1) Clone this repo:

	git clone https://github.com/cshulman/aws-ocp4.1-applier.git

2) cd aws-ocp4.1-applier/


If you are doing HTPASSWD: 
	
	1) htpasswd -c -B -b users.htpasswd username password
	
	2) oc create secret generic htpass-secret --from-file=htpasswd=</path/to/users.htpasswd> -n openshift-config


Lastly run this script which will: install galaxy, grab your cluster id, your cloud region, and run the applier:

./bin/applier.sh
