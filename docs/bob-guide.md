# Bob Guide

## Table of Contents
- [Bob Guide](#bob-guide)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
  - [Ansible MQ on OpenShift](#ansible-mq-on-openshift)
  - [Available Demos](#available-demos)
  - [Experiments](#experiments)
  - [Best Practices](#best-practices)
  - [Resources](#resources)

## Overview

Bob is an AI assistant integrated with watsonx Code Assistant that helps developers with coding tasks. It can be used for both general programming and Ansible development. This guide provides information on how to use the Bob-related content in this repository.

## Getting Started

### Prerequisites

- Microsoft Visual Studio Code
- IBM watsonx Code Assistant extension for VS Code
- IBM watsonx Code Assistant subscription with API key configured
- For Ansible work: Red Hat Ansible extension for VS Code

### Setup

1. Install the required extensions for VS Code
2. Configure your API keys and settings
3. Clone this repository and navigate to the `bob` directory

## Ansible MQ on OpenShift

The `bob/ansible-mq-ocp` directory contains an Ansible role for deploying IBM MQ on OpenShift with Hashicorp Vault integration. This project demonstrates how Bob can assist with complex Ansible role development.

Key features:
- Modular design with separate task files for maintainability
- Hashicorp Vault integration for secure credential management
- OpenShift 4.18 specific configurations and optimizations
- Comprehensive validation and testing capabilities
- Team collaboration support with clear documentation

For detailed information, see the [README.md](../bob/ansible-mq-ocp/README.md) in the ansible-mq-ocp directory.

## Available Demos

The `bob/demos` directory contains Bob-specific demos:

- **ansible**: Demos showcasing Bob's capabilities for Ansible development
- **general-programming**: Demos showcasing Bob's capabilities for general programming

Each demo directory contains:
- A README.md with instructions
- Sample code and prompts
- Expected outputs or results

## Experiments

The `bob/experiments` directory contains Bob-specific experiments:

- **ansible**: Experiments exploring Bob's capabilities for Ansible development
- **general-programming**: Experiments exploring Bob's capabilities for general programming

These experiments demonstrate more advanced or exploratory uses of Bob.

## Best Practices

When working with Bob:

1. **Be specific in your prompts**: Clearly state what you want to achieve
2. **Provide context**: Include relevant code snippets or requirements
3. **Iterate**: Refine your prompts based on the responses
4. **Verify**: Always review and test the generated code
5. **Use Bob's strengths**: Leverage Bob's capabilities for complex tasks

## Resources

- [IBM watsonx Code Assistant Documentation](https://www.ibm.com/products/watsonx-code-assistant)
- [Ansible Documentation](https://docs.ansible.com/)
- [OpenShift Documentation](https://docs.openshift.com/)
- [Hashicorp Vault Documentation](https://www.vaultproject.io/docs)