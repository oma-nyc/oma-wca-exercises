# README.md

## mq-containers-install on OCP

### Create role scaffolding

`ansible-galaxy role init mq-ocp`

### Prompt for Playbook Generation

#### Generate tasks/main.yml

Try these prompts and see what result you get.

- `Deploy IBM MQ on OpenShift with a route.`
- `Create a playbook that deploys a new IBM MQ docker container on OpenShift with a route.`

Choose the best output, generate the code, and save it in `tasks/main.yml`

### Prompts for IBM Granite.Code

#### Generate Parameterization Recommendations & Update tasks/main.yml

Create a new chat in IBM Granite.Code. Write the following prompt in IBM Granite.Code, then paste the contents of `tasks/main.yml` after the prompt before sending it to the model.

`You are an Ansible engineer. Recommend the best way to parameterize this ansible role.`

Review the output. If it does not contain a parameterized version of the original `tasks/main.yml`, issue the prompt `Parameterize the code`.

Replace `tasks/main.yml` with the parameterized code.

#### Generate defaults/main.yml

In the same IBM Granite.Code chat, issue the following prompt:

`You are an Ansible engineer. For this role, generate default variable values to be stored in defaults/main.yml.`

#### Generate meta/main.yml

In the same IBM Granite.Code chat, issue the following prompt:

`You are an Ansible engineer. For this role, generate ansible metadata content to be stored in meta/main.yml.`

#### Generate README.md

In the same IBM Granite.Code chat, issue the following prompt:

`You are an Ansible engineer. For this role, generate a README.md file that contains a summary, prerequisites, additional ansible collections needed, task explanations, variable explanations, role dependencies, license, and author information.`
