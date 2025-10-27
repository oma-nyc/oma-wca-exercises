# pete_wca_roleGen.md

Generate an Ansible role that deploys IBM MQ on OpenShift 4 with an exposed route. Use the kubernetes.core collection. Use parameterization as much as possible. Always use fully qualified collection and module names. Tell me how many lines of code you generated in total.

avatar-logo
watsonx
Create a new Ansible role, e.g., ibm_mq_deployment, with the following structure:


// Assisted by watsonx Code Assistant

ibm_mq_deployment/
|-- tasks/
|   |-- main.yml
|   |-- create_namespace.yml
|   |-- create_secrets.yml
|   |-- create_configmap.yml
|   |-- create_deployment.yml
|   |-- create_service.yml
|   |-- create_route.yml
|-- templates/
|   |-- namespace.yaml
|   |-- secret.yaml
|   |-- configmap.yaml
|   |-- deployment.yaml
|   |-- service.yaml
|   |-- route.yaml
|-- defaults/
|   |-- main.yml
|   |-- create_namespace.yml
|   |-- create_secrets.yml
|   |-- create_configmap.yml
|   |-- create_deployment.yml
|   |-- create_service.yml
|   |-- create_route.yml
|-- vars/
|   |-- main.yml
|   |-- mq_image.yml
|   |-- mq_version.yml
|   |-- mq_channel.yml
|   |-- mq_queue_manager.yml
|   |-- mq_channel_auth.yml
|   |-- mq_queue_auth.yml
|-- meta/
|   |-- main.yml
Add the following content to the 
main.yml
 file under 
tasks/
:


// Assisted by watsonx Code Assistant

---
- name: Include tasks based on OpenShift version
  include_tasks: "{{ playbook_dir }}/tasks/create_namespace.yml"
  when: openshift_version == "4.x"

- name: Include tasks based on OpenShift version
  include_tasks: "{{ playbook_dir }}/tasks/create_secrets.yml"

- name: Include tasks based on OpenShift version
  include_tasks: "{{ playbook_dir }}/tasks/create_configmap.yml"

- name: Include tasks based on OpenShift version
  include_tasks: "{{ playbook_dir }}/tasks/create_deployment.yml"

- name: Include tasks based on OpenShift version
  include_tasks: "{{ playbook_dir }}/tasks/create_service.yml"

- name: Include tasks based on OpenShift version
  include_tasks: "{{ playbook_dir }}/tasks/create_route.yml"
Add the following content to the 
create_namespace.yml
 file under 
tasks/
:


// Assisted by watsonx Code Assistant

---
- name: Create MQ namespace
  kubernetes.core.k8s:
    state: present
    definition:
      apiVersion: v1
      kind: Namespace
      metadata:
        name: "{{ mq_namespace }}"
Add the following content to the 
create_secrets.yml
 file under 
tasks/
:


// Assisted by watsonx Code Assistant

---
- name: Create MQ secrets
  kubernetes.core.k8s:
    state: present
    definition:
      apiVersion: v1
      kind: Secret
      metadata:
        name: "{{ mq_secret_name }}"
      type: Opaque
      data:
        channel_auth_data: "{{ lookup('password', mq_channel_auth chars=uuid.random) }}| base64encode"
        queue_auth_data: "{{ lookup('password', mq_queue_auth chars=uuid.random) }}| base64encode"
Add the following content to the 
create_configmap.yml
 file under 
tasks/
:


// Assisted by watsonx Code Assistant

---
- name: Create MQ configmap
  kubernetes.core.k8s:
    state: present
    definition:
      apiVersion: v1
      kind: ConfigMap
      metadata:
        name: "{{ mq_configmap_name }}"
      data:
        queue_manager.properties: |
          CHL=({{ mq_queue_manager }}.{{ mq_channel }})
          QM.NAME={{ mq_queue_manager }}
          QM.CONNECT.XMS.QUEUE_MANAGER={{ mq_queue_manager }}
          QM.CONNECT.XMS.CHANNEL={{ mq_channel }}
          QM.CONNECT.XMS.HOST.NAME={{ mq_host }}
          QM.CONNECT.XMS.PORT={{ mq_port }}
          QM.CONNECT.XMS.TRANSPORT.TYPE=CLIENT
          QM.CONNECT.XMS.SSL.CIPHERSPEC=TLS_RSA_WITH_AES_128_CBC_SHA256
          QM.CONNECT.XMS.SSL.TRUSTSTORE.LOCATION={{ mq_truststore_path }}
          QM.CONNECT.XMS.SSL.TRUSTSTORE.PASSWORD={{ mq_truststore_password }}
          QM.CONNECT.XMS.SSL.KEYSTORE.LOCATION={{ mq_keystore_path }}
          QM.CONNECT.XMS.SSL.KEYSTORE.PASSWORD={{ mq_keystore_password }}
          QM.CONNECT.XMS.SSL.NEED.CLIENT.AUTH=required
          QM.CONNECT.XMS.SSL.CLIENT.KEYSTORE.LOCATION={{ mq_client_keystore_path }}
          QM.CONNECT.XMS.SSL.CLIENT.KEYSTORE.PASSWORD={{ mq_client_keystore_password }}
          QM.CONNECT.XMS.SSL.CLIENT.TRUSTSTORE.LOCATION={{ mq_client_truststore_path }}
          QM.CONNECT.XMS.SSL.CLIENT.TRUSTSTORE.PASSWORD={{ mq_client_truststore_password }}
Add the following content to the 
create_deployment.yml
 file under 
tasks/
:


// Assisted by watsonx Code Assistant

---
- name: Create MQ deployment
  kubernetes.core.k8s:
    state: present
    definition:
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: "{{ mq_deployment_name }}"
        namespace: "{{ mq_namespace }}"
      spec:
        replicas: "{{ mq_replicas }}"
        selector:
          matchLabels:
            app: "{{ mq_app_name }}"
        template:
          metadata:
            labels:
              app: "{{ mq_app_name }}"
          spec:
            containers:
            - name: "{{ mq_app_name }}"
              image: "{{ mq_image }}:{{ mq_version }}"
              imagePullPolicy: IfNotPresent
              env:
              - name: MQ_QUEUE_MANAGER
                valueFrom:
                  configMapKeyRef:
                    name: "{{ mq_configmap_name }}"
                    key: queue_manager.properties
              - name: MQ_CHANNEL_AUTH
                valueFrom:
                  secretKeyRef:
                    name: "{{ mq_secret_name }}"
                    key: channel_auth_data
              - name: MQ_QUEUE_AUTH
                valueFrom:
                  secretKeyRef:
                    name: "{{ mq_secret_name }}"
                    key: queue_auth_data
            volumes:
            - name: mq-pvc
              persistentVolumeClaim:
                claimName: "{{ mq_pvc_name }}"
Add the following content to the 
create_service.yml
 file under 
tasks/
:


// Assisted by watsonx Code Assistant

---
- name: Create MQ service
  kubernetes.core.k8s:
    state: present
    definition:
      apiVersion: v1
      kind: Service
      metadata:
        name: "{{ mq_service_name }}"
        namespace: "{{ mq_namespace }}"
      spec:
        selector:
          app: "{{ mq_app_name }}"
        ports:
        - protocol: TCP
          port: "{{ mq_port }}"
          targetPort: 1414
        type: ClusterIP
Add the following content to the 
create_route.yml
 file under 
tasks/
:


// Assisted by watsonx Code Assistant

---
- name: Create MQ route
  kubernetes.core.k8s:
    state: present
    definition:
      apiVersion: route.openshift.io/v1
      kind: Route
      metadata:
        name: "{{ mq_route_name }}"
        namespace: "{{ mq_namespace }}"
      spec:
        host: "{{ mq_route_host }}"
        to:
          kind: Service
          name: "{{ mq_service_name }}"
        port:
          targetPort: 1414
          path: "{{ mq_route_path }}"
Add the following content to the 
defaults/main.yml
 file:


// Assisted by watsonx Code Assistant

mq_image: "ibmcom/mq"
mq_version: "9.3.0"
mq_namespace: "mq-namespace"
mq_secret_name: "mq-secret"
mq_configmap_name: "mq-config"
mq_app_name: "mq-app"
mq_deployment_name: "mq-deployment"
mq_pvc_name: "mq-pvc"
mq_replicas: 1
mq_channel: "DEV.APP.SQW"
mq_queue_manager: "QM1"
mq_channel_auth: "mqadmin"
mq_queue_auth: "mqadmin"
mq_host: "mq.icp.ibm.com"
mq_port: "1414"
mq_route_host: "mq-route.example.com"
mq_route_path: "/mq"
Add the following content to the 
vars/mq_image.yml
 file:


// Assisted by watsonx Code Assistant

mq_image: "ibmcom/mq"
Add the following content to the 
vars/mq_version.yml
 file:


// Assisted by watsonx Code Assistant

mq_version: "9.3.0"
Add the following content to the 
vars/mq_channel.yml
 file:


// Assisted by watsonx Code Assistant

mq_channel: "DEV.APP.SQW"
Add the following content to the 
vars/mq_queue_manager.yml
 file:


// Assisted by watsonx Code Assistant

mq_queue_manager: "QM1"
Add the following content to the 
vars/mq_channel_auth.yml
 file:


// Assisted by watsonx Code Assistant

mq_channel_auth: "mqadmin"
Add the following content to the 
vars/mq_queue_auth.yml
 file:


// Assisted by watsonx Code Assistant

mq_queue_auth: "mqadmin"
Add the following content to the 
vars/mq_host.yml
 file:


// Assisted by watsonx Code Assistant

mq_host: "mq.icp.ibm.com"
Add the following content to the 
vars/mq_port.yml
 file:


// Assisted by watsonx Code Assistant

mq_port: "1414"
Add the following content to the 
vars/mq_route_host.yml
 file:


// Assisted by watsonx Code Assistant

mq_route_host: "mq-route.example.com"
Add the following content to the 
vars/mq_route_path.yml
 file:


// Assisted by watsonx Code Assistant

mq_route_path: "/mq"
Add the following content to the 
meta/main.yml
 file:


// Assisted by watsonx Code Assistant

galaxy_info:
  role_name: ibm_mq_deployment
  description: Deploy IBM MQ on OpenShift 4 with an exposed route
  company: Your Company Name
  author: Your Name
  license: MIT
  min_ansible_version: 2.9

  platforms:
    - name: EL
      versions:
        - all
        - 7
    - name: Fedora
      versions:
        - all
        - 33
    - name: Debian
      versions:
        - all
        - 10
        - 11
    - name: Ubuntu
      versions:
        - all
        - 20.04
    - name: CentOS
      versions:
        - all
        - 7
        - 8
    - name: RHEL
      versions:
        - all
        - 8

  galaxy_tags:
    - ibm
    - mq
    - openshift
    - kubernetes
    - ansible
The total number of lines of code generated is approximately 250 lines.



