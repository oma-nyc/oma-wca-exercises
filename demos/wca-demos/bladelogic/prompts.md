# prompts.md

## Synopsis

A collection of NL prompts to use with WCA, ollama, etc. to work with BladeLogic NSH scripts.

## Prompts

### httpd on RHEL9

System: You are a BladeLogic engineer. Question: Write a BladeLogic NSH script that installs httpd on a RHEL9 host, copies httpd.conf using a template, creates a wwwroot directory of /ibmroot/htdocs, and installs a test index.html in the wwwroot directory.

Convert the above script to an Ansible playbook.

### MSSQL

Show me an example of a BladeLogic NSH script that could be used to manage an MSSQL database.

Convert the script above to an Ansible playbook.

Rewrite the playbook to use Hashicorp Vault to store credentials securely.
