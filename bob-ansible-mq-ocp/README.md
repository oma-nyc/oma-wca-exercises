# IBM MQ on OpenShift Ansible Role

An Ansible role for deploying IBM MQ on OpenShift with Hashicorp Vault integration for secure credential management.

## Synopsis

This role automates the deployment of IBM MQ on OpenShift 4.18 or higher with a focus on security, modularity, and team collaboration. It leverages Hashicorp Vault for secure credential management and implements OpenShift best practices.

Key features:
- Modular design with separate task files for maintainability
- Hashicorp Vault integration for secure credential management
- OpenShift 4.18 specific configurations and optimizations
- Comprehensive validation and testing capabilities
- Team collaboration support with clear documentation

## Prerequisites

### OpenShift Requirements
- OpenShift 4.18 or higher
- `oc` CLI tool installed and configured
- Cluster admin access or appropriate permissions

### IBM MQ Requirements
- Access to IBM MQ container images (e.g., `icr.io/ibm-messaging/mq:9.3.0.0`)
- IBM MQ license acceptance

### Hashicorp Vault Requirements
- Hashicorp Vault server (accessible from Ansible control node)
- Vault authentication credentials (token, AppRole, or Kubernetes)
- Appropriate Vault policies for secret access

### Ansible Requirements
- Ansible 2.10 or higher
- Python 3.6 or higher
- Required collections (see Dependencies section)

## Dependencies

### Ansible Collections
- `kubernetes.core`: For OpenShift/Kubernetes resource management
- `community.hashi_vault`: For Hashicorp Vault integration
- `community.general`: For general utilities
- `ansible.posix`: For POSIX-related tasks

Install required collections:
```bash
ansible-galaxy collection install kubernetes.core community.hashi_vault community.general ansible.posix
```

### Python Modules
- `openshift`: For OpenShift API interaction
- `kubernetes`: For Kubernetes API interaction
- `hvac`: For Hashicorp Vault API interaction

Install required Python modules:
```bash
pip install openshift kubernetes hvac
```

## Role Structure

```
mq-ocp/
├── defaults/
│   └── main.yml             # Default variable values
├── files/
│   └── validation/          # Scripts for validation
├── handlers/
│   └── main.yml             # Handlers for notifications
├── meta/
│   └── main.yml             # Role metadata, dependencies
├── tasks/
│   ├── main.yml             # Main task file that includes other task files
│   ├── preflight.yml        # Preflight checks and validations
│   ├── vault.yml            # Hashicorp Vault integration
│   ├── namespace.yml        # Namespace creation
│   ├── security.yml         # Security context constraints
│   ├── service_account.yml  # Service account creation
│   ├── pvc.yml              # Persistent volume claims
│   ├── deployment.yml       # MQ deployment
│   ├── service.yml          # Service creation
│   ├── route.yml            # Route creation
│   └── validation.yml       # Post-deployment validation
├── templates/
│   ├── configmap.yml.j2     # Templates for MQ configuration
│   └── deployment.yml.j2    # Templates for deployment
├── tests/
│   ├── inventory            # Test inventory
│   └── test.yml             # Test playbook
└── vars/
    └── main.yml             # Variables that shouldn't be overridden
```

## Getting Started

### Basic Usage

1. Install required collections and dependencies:
   ```bash
   ansible-galaxy collection install kubernetes.core community.hashi_vault community.general ansible.posix
   pip install openshift kubernetes hvac
   ```

2. Configure Vault with the necessary secrets:
   ```bash
   # Create secrets in Vault
   vault kv put secret/mq/mq-admin-password password="YourSecurePassword"
   vault kv put secret/mq/mq-app-password password="YourSecureAppPassword"
   ```

3. Run the playbook:
   ```bash
   ansible-playbook site.yml -e "vault_addr=https://vault.example.com:8200 vault_auth_method=token vault_token=hvs.your-token"
   ```

### Using Environment-Specific Inventories

For development:
```bash
ansible-playbook -i inventory/development site.yml
```

For production:
```bash
ansible-playbook -i inventory/production site.yml
```

### Using the Makefile

The repository includes a Makefile with common operations:

```bash
# Deploy to development
make deploy-dev

# Deploy to production
make deploy-prod

# Undeploy from development
make undeploy-dev

# Run tests
make test
```

## License

MIT

## Author Information

Your Team  
Your Company