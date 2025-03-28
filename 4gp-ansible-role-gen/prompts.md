# prompts.md

## Synopsis

Use an Open Source IBM Granite Code Instruct LLM to develop an Ansible roles that deploys IBM MQ on OpenShift with an exposed route.

## Prerequisites

### Hardware

- M-family (`aarch64`) MacBook Pro
- at least 32GB RAM
- Internet connectivity

### Software

- Microsoft VS Code
- IBM Granite.Code Extension for VS Code (including the `ollama` prerequisite)
- Homebrew for MacOS

## Up & Running

1. In a terminal window, run `ollama serve`
2. In VS Code, open your settings with `Ctrl-,` and search for "granite"
   1. Change the two models shown from `granite-code:8b` to `granite-code:20b`
   2. (Optional) change the IP Address and Port to an external ollama server if instructed to do so by the lab proctor.
3. In VS Code, expand "GRANITE.CODE: CHAT" in the left margin.

## Prompts

### Method One - Use IBM Granite.Code & the Open Source Granite Code Instruct 20B LLM

In the IBM Granite.Code chat tool, click on the hamburger menu and create a new chat. Then, one at a time and in the following order, issue each of the following prompts.

```text
System: You are an ansible engineer. Question: Write an Ansible playbook that deploys IBM MQ on OpenShift with an exposed route.

# Optional - in case the result uses ansible.builtin.command and oc
Question: Rewrite the playbook using the kubernetes.core collection.

Question: Recommend ways to parameterize this playbook.

Question: Write the same playbook using recommended parameters.

Question: Write defaults/main.yml with the default values for use in an Ansible role.

Question: Write meta/main.yml with the metadata for use in an Ansible role.

Question: Write README.md with the summary, prerequisites, additional ansible collections, task explanations, variable explanations, license, and author information for use in an Ansible role.
```

### Method Two - Use WCA4A Playbook Generation for the first task & IBM Granite.Code for the remaining tasks.

In this method, we generate the `tasks/main.yml` using Playbook Generation in WCA4A in Task 1, then feed its output to IBM Granite.Code in the remaining tasks.

1. Open Playbook Generation in WCA4A and issue the following prompt:

```text
Write an Ansible playbook that deploys IBM MQ on OpenShift with an exposed route.
```
2. Accept the outline
3. Generate the playbook
4. Open IBM Granite.Code and paste in this prompt followed by the tasks generated by Playbook Generation. Do not issue the prompt until it includes both the text below and the contents of all the generated tasks, because otherwise the context will be lost.

```text
Question: Recommend ways to parameterize this playbook.
```

5. Issue the remaining tasks in IBM Granite.Code in the order shown below.

```text
Question: Write the same playbook using recommended parameters.

Question: Write defaults/main.yml with the default values for use in an Ansible role.

Question: Write meta/main.yml with the metadata for use in an Ansible role.

Question: Write README.md with the summary, prerequisites, additional ansible collections, task explanations, variable explanations, license, and author information for use in an Ansible role.
```
