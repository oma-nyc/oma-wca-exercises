# watsonx Code Assistant for Red Hat Ansible Lightspeed Guide

## Table of Contents
- [watsonx Code Assistant for Red Hat Ansible Lightspeed Guide](#watsonx-code-assistant-for-red-hat-ansible-lightspeed-guide)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
  - [Available Demos](#available-demos)
  - [Experiments](#experiments)
  - [Best Practices](#best-practices)
  - [Resources](#resources)

## Overview

watsonx Code Assistant for Red Hat Ansible Lightspeed (WCA4A) is an AI-powered assistant specifically designed for Ansible automation. It helps developers write, understand, and transform Ansible playbooks and roles. This guide provides information on how to use the WCA4A demos and experiments in this repository.

## Getting Started

### Prerequisites

- Microsoft Visual Studio Code
- Red Hat Ansible extension for VS Code
- Red Hat Ansible Automation Platform (provides Ansible Lightspeed subscription)
- Red Hat SSO account
- IBM watsonx Code Assistant Essentials or Standard plan configured with Service ID, Deployment Space, API Key, and base Model ID
- Red Hat Ansible Lightspeed portal configured with API Key and base Model ID from IBM watsonx Code Assistant Essentials or Standard plan

### Setup

1. Install the Red Hat Ansible extension for VS Code
2. Configure your Red Hat SSO account
3. Set up the Ansible Lightspeed integration with watsonx Code Assistant
4. Clone this repository and navigate to the `wca4a` directory

## Available Demos

The `wca4a/demos` directory contains structured demos for Ansible automation:

- **ansible-kubevirt**: Demonstrates using WCA4A with KubeVirt
- **ansible-module-dev**: Shows how WCA4A can assist with Ansible module development
- **ansible-role-gen**: Illustrates generating Ansible roles with WCA4A
- **content-gen**: Examples of content generation with WCA4A
- **explanation**: Demonstrates how WCA4A can explain Ansible concepts and code
- **hcp-vault**: Shows integration with HashiCorp Vault
- **playbook-gen**: Examples of playbook generation with WCA4A
- **role-gen**: Additional examples of role generation

Each demo directory contains:
- A README.md with instructions
- Sample playbooks and roles
- Expected outputs or results

## Experiments

The `wca4a/experiments` directory contains experimental Ansible projects:

- **4a-oma-flow**: Experiments with OMA workflow
- **ansible-terraform**: Integration experiments with Terraform
- **tech4_testing_folder**: Tech4 testing experiments
- **tech5_testing_folder**: Tech5 testing experiments
- **vienna**: Vienna-specific experiments for Ansible

These experiments demonstrate more advanced or exploratory uses of WCA4A.

## Best Practices

When using watsonx Code Assistant for Ansible:

1. **Be specific in your prompts**: Clearly state what you want to achieve
2. **Provide context**: Include relevant playbook snippets or requirements
3. **Iterate**: Refine your prompts based on the responses
4. **Verify**: Always review and test the generated Ansible code
5. **Use modules**: Leverage Ansible modules for better maintainability

## Resources

- [Official Red Hat Ansible Lightspeed Documentation](https://www.redhat.com/en/technologies/management/ansible/lightspeed)
- [IBM watsonx Code Assistant Documentation](https://www.ibm.com/products/watsonx-code-assistant)
- [Ansible Documentation](https://docs.ansible.com/)
- [Prompting Guide](./prompting-guide/4a-prompting-guide.md)