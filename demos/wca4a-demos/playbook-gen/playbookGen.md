
# playbookGen.md

## Synopsis

This document describes a simple introduction to effective prompt writing techniques for Ansible playbook generation.

## Exercises

### Okay

Review the playbook generation prompt below.

`Create IIS websites on port 8080 and 8081 and open firewall.`

Use this prompt to generate a playbook and review the results.

### Better

We attempt to add a supplemental port. Note that this prompt is not precise enough and will not configure firewall correctly.

`Create IIS websites on port 8080 and 8081 and open firewall. Also add a firewall rule to allow HTTP traffic on port 8082 too.`

### Best

This prompt gives enough details to the model so that IIS and its ports are properly configured, as well as the supplemental port.

`Create IIS websites on port 8080 and 8081 and open firewall for IIS. Also add a firewall rule to allow HTTP traffic on port 8082 too.`
