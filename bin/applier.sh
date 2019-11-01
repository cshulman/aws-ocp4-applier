#!/bin/bash

# Install galaxy
#ansible-galaxy install -r requirements.yml -p galaxy

# Grab cluster id
cluster_id=$(oc get machinesets -n openshift-machine-api -o jsonpath='{.items[0].metadata.labels.machine\.openshift\.io\/cluster-api-cluster}')

# Grab cloud region
cloud_region=$(oc get machinesets -n openshift-machine-api -o jsonpath='{.items[0].spec.template.spec.providerSpec.value.placement.region}')

#Set following vars:
#cluster_id=id
#cloud_region=region
ami_id="ami-0bc59aaa7363b805d"
machine_role="infra"
machine_type="m5.xlarge"
security_group=${cluster_id}-worker-sg
iam_profile=${cluster_id}-worker-profile
min_machines="1"
max_machines="12"

# Run applier


##Applier command for creating machineset
#ansible-playbook -i .applier/ galaxy/openshift-applier/playbooks/openshift-cluster-seed.yml -e clusterid=${cluster_id} -e cloudregion=${cloud_region} -e role=${machine_role} -e amiid=${ami_id} -e machinetype=${machine_type} -e securitygroup=${security_group} -e iamprofile=${iam_profile} -e include_tags="machinesets" -vvv


##Applier command for autoscaling
ansible-playbook -i .applier/ galaxy/openshift-applier/playbooks/openshift-cluster-seed.yml -e clusterid=${cluster_id} -e cloudregion=${cloud_region} -e role=${machine_role} -e amiid=${ami_id} -e min=${min_machines} -e max=${max_machines} -e include_tags="autoscaling" -vvv
