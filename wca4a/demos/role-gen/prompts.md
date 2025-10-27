# 4a-role-gen prompts.md

## mq-ocp

Create a new ibm-mq namespace on OpenShift 4. Deploy IBM MQ with an exposed route. Use the kubernetes.core collection.

Create a new ibm-mq namespace on OpenShift 4. Create a Deploy IBM MQ with an exposed route. Use the kubernetes.core collection. Parameterize all possible variables including the MQ queue name and credentials.

You are an Ansible automation engineer. Begin developing an Ansible role that will deploy IBM MQ on OpenShift 4. Start with tasks/main.yml and use the kubernetes.core collection.

## CIS

Download cis benchmark for rhel9 x86_64. Make a copy of the benchmark files. Create a custom benchmark file that excludes all selinux checks. Scan servers based on the custom benchmark and output the findings. Remediate the critical and high findings on the servers in violation.

## macOS Laptop Day0/1

Create a role called ansible-dev-macos that deploys homebrew on macOS and maintains a list of homebrew packages and casks that a typical Ansible engineer would need, such as python, pip, ansible, ansible-lint, the Ansible module python SDK, etc.

Create a role that gathers the names of all the homebrew packages and casks that are currently installed on my macos laptop, so that they can be installed on a new laptop using Ansible.

Create a role that gathers the names of all the homebrew packages and casks that are currently installed on my macos laptop. Include a task that loops through the list of packages and installs them.

Write tasks/main.yml that installs xcode-select, accepts the xcodebuild license, installs Homebrew from github, and installs git using Homebrew.



## OpenShift VMware IPI Bastion Host - vCenter Certs Installation

Download the vSphere vCenter certificates from the vCenter server, install them on the bastion host, and update the CA trust.

## OpenShift Mirror Registry Creation on partially connected airgapped cluster

Create a directory in $HOME called imageset. Copy imageset-config.yaml to the new directory. Mirror the images in imageset-config.yaml to a tarball in the imageset directory, then mirror the tarball contents to an internal image registry at registry.gym.lan.

## Install OpenShift tools on the bastion host

Download the latest  openshift client, openshift-install client, core-os installer for amd64, oc-mirror plug-in, and mirror-registry tarballs from Red Hat, then install them in /usr/local/bin on the bastion host.

## Install and configure an OpenShift mirror registry for an airgapped installation

Create directory /run/user/1000/containers with mode 700 owner admin group admin. Touch the file /run/user/1000/containers/auth.json. Copy pull-secret.json to /run/user/1000/containers/auth.json. Change all single quotes to double quotes in /run/user/1000/containers/auth.json with regex. Install the mirror registry with quayHostname registry.gym.lan and save the output to a variable mrlog. Extract the quay registry password from the last line of mrlog. Display the quay registry password. Create a new directory /home/admin/quay-install.  Base64encode the quay registry password and save it in /home/admin/quay-install/info.txt with 600 permissions. Log into registry.gym.lan with username init and the quay registry password. Verify the registry.gym.lan credentials were added to /run/user/1000/containers/auth.json, and if they were not, add them.




