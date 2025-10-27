# IBM MQ on OpenShift Role

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

## Role Variables

### OpenShift Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `openshift_version` | OpenShift version | `"4.18"` |
| `mq_namespace` | Namespace for IBM MQ deployment | `"mq-dev"` |
| `mq_create_namespace` | Whether to create the namespace | `true` |
| `mq_namespace_labels` | Labels to apply to the namespace | `{app.kubernetes.io/name: ibm-mq, app.kubernetes.io/managed-by: ansible}` |

### Service Account Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `mq_service_account` | Service account name | `"mq-service-account"` |
| `mq_scc_name` | Security context constraints name | `"mq-scc"` |
| `mq_role_name` | Role name | `"mq-role"` |
| `mq_role_binding_name` | Role binding name | `"mq-role-binding"` |

### Storage Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `mq_pvc_name` | Persistent volume claim name | `"mq-data-pvc"` |
| `mq_storage_size` | Storage size for MQ data | `"2Gi"` |
| `mq_storage_class` | Storage class | `""` (use default) |
| `mq_access_mode` | Access mode for the PVC | `"ReadWriteOnce"` |

### IBM MQ Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `mq_deployment_name` | Deployment name | `"mq-deployment"` |
| `mq_app_label` | App label for selectors | `"ibm-mq"` |
| `mq_container_name` | Container name | `"mq"` |
| `mq_image` | IBM MQ image | `"icr.io/ibm-messaging/mq"` |
| `mq_version` | IBM MQ version | `"9.3.0.0"` |
| `mq_license` | IBM MQ license acceptance | `"accept"` |
| `mq_qmgr_name` | Queue manager name | `"QM1"` |
| `mq_replicas` | Number of replicas | `1` |

### Resource Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `mq_cpu_request` | CPU request | `"500m"` |
| `mq_memory_request` | Memory request | `"512Mi"` |
| `mq_cpu_limit` | CPU limit | `"1"` |
| `mq_memory_limit` | Memory limit | `"1Gi"` |

### Networking Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `mq_service_name` | Service name | `"mq-service"` |
| `mq_service_type` | Service type | `"ClusterIP"` |
| `mq_route_name` | Route name | `"mq-route"` |
| `mq_expose_web_console` | Whether to expose the web console | `true` |
| `mq_expose_mq_port` | Whether to expose the MQ port | `false` |

### Hashicorp Vault Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `vault_addr` | Vault server address | `"https://vault.example.com:8200"` |
| `vault_auth_method` | Vault authentication method | `"approle"` |
| `vault_auth_mount_point` | Vault auth mount point | `"auth/approle"` |
| `vault_secret_path` | Base path for MQ secrets | `"secret/mq"` |
| `mq_admin_password_path` | Path to admin password | `"mq-admin-password"` |
| `mq_app_password_path` | Path to app password | `"mq-app-password"` |
| `mq_tls_cert_path` | Path to TLS certificate | `"mq-tls-cert"` |

### Validation Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `mq_validate_deployment` | Whether to validate the deployment | `true` |
| `mq_validation_retries` | Number of retries for validation | `10` |
| `mq_validation_delay` | Delay between retries (seconds) | `30` |
| `mq_create_test_queue` | Whether to create a test queue | `true` |
| `mq_cleanup_test_queue` | Whether to clean up test queue | `true` |

## Example Playbook

```yaml
---
- name: Deploy IBM MQ on OpenShift
  hosts: localhost
  connection: local
  gather_facts: false
  vars:
    openshift_version: "4.18"
    mq_namespace: "mq-prod"
    mq_qmgr_name: "QM1"
    vault_addr: "https://vault.example.com:8200"
    vault_auth_method: "approle"
    vault_role_id: "your-role-id"
    vault_secret_id: "your-secret-id"
    vault_secret_path: "secret/mq"
  roles:
    - role: mq-ocp
```

## License

MIT

## Author Information

Your Team  
Your Company