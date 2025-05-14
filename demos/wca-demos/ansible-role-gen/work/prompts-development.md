# prompts-development.md

## Keep your prompts here

Short list of use cases

- httpd day0/1
- Another more complex OS config (Linux before Windows)
  - AIX on Power?
- Implement MQ in containers
- Network device management

## httpd day0/1

### httpd install & configure

Install httpd with a default html directory of /ibmroot/htmldocs owned by apache:apache. Load httpd.conf from a template. Create /var/log/httpd with 750 permissions. Use /var/log/httpd as the default logging directory. Enable httpd to start at boot. Start the httpd service.

### httpd install & configure with jinja2

Create variables for httpd-document-root and httpd-log root. Install httpd. Create a default html directory of {{ httpd-document-root }} owned by apache:apache. Load httpd.conf from a template. Create {{ httpd-log-root }} with 750 permissions. Enable httpd to start at boot. Start the httpd service.

#### as above with metadata prompt

Create variables for httpd-document-root httpd-log-root meta-author meta-description meta-license meta-min-ansible-version meta-galaxy-tags. Install httpd. Create a default html directory of {{ httpd-document-root }} owned by apache:apache. Load httpd.conf from a template. Create {{ httpd-log-root }} with 750 permissions. Enable httpd to start at boot. Start the httpd service. Generate metadata for this playbook on localhost.

### httpd install & configure with "recommend variables" in the prompt

### httpd install & configure with jinja2 and ask to explain the content

## Network Device Management

### Cisco NXOS Interface Management

Create variables for description primary-address secondary-address log-directory. Create a new Cisco NXOS GigabitEthernet interface.  Set a description of {{ description }}. Configure it to use DHCP. Configure it to use a primary address of {{ primary-address }} and a secondary address of {{ secondary-address }}. Configure the log directory as {{ log-directory }}. Start the interface. Generate metadata for this playbook on localhost.


### Juniper JUNOS Interface Management

### Juniper BGP Neighbor Configuration

### Cisco NXOS Prefix-List

## mq-containers-install on OCP

### Create role scaffolding

`ansible-galaxy role init mq-ocp`

### Prompts for Playbook Generation

Deploy a new IBM MQ docker container on OpenShift with a route.

Create an ansible playbook that deploys IBM MQ on OpenShift.

### Prompts for IBM Granite.Code / watsonx.ai Prompt Lab

You are an Ansible engineer. Recommend the best way to parameterize this ansible role.

You are an Ansible engineer. For this role, generate default variable values to be stored in defaults/main.yml.

You are an Ansible engineer. For this role, generate ansible metadata content to be stored in meta/main.yml.

You are an Ansible engineer. For this role, generate a README.md file that contains a summary, prerequisites, additional ansible collections needed, task explanations, variable explanations, role dependencies, license, and author information.
