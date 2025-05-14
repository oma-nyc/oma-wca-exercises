# README.md

## Synopsis

Demonstrate various techniques for developing roles using AI.

## Prerequisites

- Microsoft VS Code with the following extensions installed:
  - Red Hat Ansible Extension
  - IBM Granite.Code Extension
- Red Hat Ansible Automation Platform
- IBM watsonx Code Assistant for Red Hat Ansible Lightspeed
  - WCA integrated with AAP
- ollama
- code instruct model such as code-instruct:8b

## Demos

### mq-ocp: IBM MQ on OpenShift

1. Create role scaffolding

    ```bash
    mkcd roles
    ansible-galaxy role init mq-ocp
    ```
2. Prompt

    ```markdown
    You are an ansible engineer. Generate the files needed for an ansible role that deploys IBM MQ on OpenShift including a parameterized task list to be stored in tasks/main.yml, default parameter variables to be stored in defaults/main.yml, metadata to be stored in meta/main.yml, and a README.md that contains a summary, prerequisites, additional ansible collections needed, task explanations, variable explanations, role dependencies, license, and author information.

3. Prompt for tasks/main.yml using Ansible Lightspeed Playbook Generation.

    Deploy IBM MQ on OpenShift with a route.

4. Prompt for Paramaterization Recommendations

    You are an Ansible engineer. Recommend the best way to parameterize this ansible role.
PL: You are an ansible engineer. Please recommend the best way to parameterize ansible yml provided.

You are an Ansible engineer. For this role, generate default variable values to be stored in defaults/main.yml.
PL: You are an ansible expert. Generate default values for the variables and produce them in a format that can be used in defaults/main.yml.

You are an Ansible engineer. For this role, generate ansible metadata content to be stored in meta/main.yml.
PL: You are an Ansible engineer. For this role, generate ansible metadata content to be stored in meta/main.yml. Please generate values for galaxy_tags that are relevant to the provided role.

You are an Ansible engineer. For this role, generate a README.md file that contains a summary, prerequisites, additional ansible collections needed, task explanations, variable explanations, role dependencies, license, and author information.
PL: You are an Ansible engineer. For this role, generate a README.md file that contains a summary, prerequisites, additional ansible collections needed, task explanations, variable explanations, role dependencies, license, and author information.
