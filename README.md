# oma-wca-exercises

## Table of Contents
- [oma-wca-exercises](#oma-wca-exercises)
  - [Table of Contents](#table-of-contents)
  - [Synopsis](#synopsis)
  - [Abbreviations](#abbreviations)
  - [Repository Structure](#repository-structure)
  - [Prerequisites](#prerequisites)
    - [Common](#common)
    - [watsonx Code Assistant](#watsonx-code-assistant)
    - [watsonx Code Assistant for Red Hat Ansible Lightspeed](#watsonx-code-assistant-for-red-hat-ansible-lightspeed)
  - [Getting Started](#getting-started)
  - [Documentation](#documentation)
  - [Author](#author)

## Synopsis

A collection of demos and experiments to use with watsonx Code Assistant and watsonx Code Assistant for Red Hat Ansible Lightspeed. This repository serves as a resource for learning and exploring the capabilities of these AI-powered coding assistants.

## Abbreviations

- wca - watsonx Code Assistant
- wca4a - watsonx Code Assistant for Red Hat Ansible Lightspeed

## Repository Structure

The repository is organized into the following main sections:

- [`wca/`](./wca/) - watsonx Code Assistant demos and experiments for general programming
  - [`demos/`](./wca/demos/) - Structured demos showcasing specific use cases
  - [`experiments/`](./wca/experiments/) - Experimental projects and proof of concepts

- [`wca4a/`](./wca4a/) - watsonx Code Assistant for Red Hat Ansible Lightspeed
  - [`demos/`](./wca4a/demos/) - Structured demos for Ansible automation
  - [`experiments/`](./wca4a/experiments/) - Experimental Ansible projects

- [`bob/`](./bob/) - Bob-related demos, experiments, and projects
  - [`ansible-mq-ocp/`](./bob/ansible-mq-ocp/) - Ansible role for deploying IBM MQ on OpenShift
  - [`demos/`](./bob/demos/) - Bob-specific demos
  - [`experiments/`](./bob/experiments/) - Bob-specific experiments

- [`docs/`](./docs/) - Documentation and guides
  - [`prompting-guide/`](./docs/prompting-guide/) - Guide for effective prompting
  - Various guides for each major component

- [`assets/`](./assets/) - Tools and resources
  - [`vsix/`](./assets/vsix/) - VS Code extensions

- [`archive/`](./archive/) - Archived content that's no longer actively maintained

## Prerequisites

### Common

- Microsoft Visual Studio Code

### watsonx Code Assistant

- IBM watsonx Code Assistant extension for VS Code
- IBM watsonx Code Assistant subscription with API key configured

### watsonx Code Assistant for Red Hat Ansible Lightspeed

- Red Hat Ansible extension for VS Code
- Red Hat Ansible Automation Platform (provides Ansible Lightspeed subscription)
- Red Hat SSO account
- IBM watsonx Code Assistant Essentials or Standard plan configured with Service ID, Deployment Space, API Key, and base Model ID
- Red Hat Ansible Lightspeed portal configured with API Key and base Model ID from IBM watsonx Code Assistant Essentials or Standard plan

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/oma-wca-exercises.git
   cd oma-wca-exercises
   ```

2. Explore the demos and experiments in the respective directories:
   - For general programming: See the [`wca/`](./wca/) directory
   - For Ansible automation: See the [`wca4a/`](./wca4a/) directory
   - For Bob-related content: See the [`bob/`](./bob/) directory

3. Refer to the documentation in the [`docs/`](./docs/) directory for guides and best practices.

## Documentation

- [Prompting Guide](./docs/prompting-guide/4a-prompting-guide.md) - Guide for effective prompting
- [WCA Guide](./docs/wca-guide.md) - Guide for watsonx Code Assistant
- [WCA4A Guide](./docs/wca4a-guide.md) - Guide for watsonx Code Assistant for Ansible
- [Bob Guide](./docs/bob-guide.md) - Guide for Bob-related work

## Author

pete nuwayser @pnuw-ibm pnuw@ibm.com
