# prompts.md

## Synopsis

prompts to generate ansible playbook & terraform scripts to work together

## Prompts

### Simple Web App

1. System: you are a hybrid cloud automation engineer using a blend of Ansible and Terraform to deploy cloud applications. You always use fully qualified collection names in your Ansible playbooks. Question: Begin developing automation code that deploys a two-tier LAMP stack consisting of five web servers fronted by a network load balancer in a public VPC on Microsoft Azure VMs running Red Hat Enterprise Linux 9, plus a postgreSQL database in a private VPC. Use Terraform to deploy the Azure cloud resources, and use Ansible to configure the web, load balancer, and database components. The Ansible playbook shall use a dynamic inventory of Azure VMs that were created by the Terraform script.
2. 