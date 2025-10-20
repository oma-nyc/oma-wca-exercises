# Molecule Testing for IBM MQ on OpenShift Role

This directory contains [Molecule](https://molecule.readthedocs.io/) test scenarios for the IBM MQ on OpenShift role.

## Test Scenarios

The role includes three test scenarios:

1. **default**: Basic deployment with standard configuration
2. **production**: High-availability deployment with production-grade resources and security
3. **minimal**: Minimal deployment with reduced resource requirements

## Prerequisites

To run these tests, you need:

1. Molecule installed:
   ```bash
   pip install molecule molecule-plugins[docker]
   ```

2. Required collections:
   ```bash
   ansible-galaxy collection install kubernetes.core community.hashi_vault community.general ansible.posix
   ```

3. Required Python modules:
   ```bash
   pip install openshift kubernetes hvac
   ```

4. Access to an OpenShift cluster with:
   - `oc` CLI tool installed and configured
   - Logged in with appropriate permissions

## Running Tests

### Running All Tests

```bash
cd roles/mq-ocp
molecule test --all
```

### Running a Specific Scenario

```bash
cd roles/mq-ocp
molecule test -s default
molecule test -s production
molecule test -s minimal
```

### Running Individual Steps

You can run individual steps of the test sequence:

```bash
# Lint only
molecule lint -s default

# Create resources and converge
molecule create -s default
molecule converge -s default

# Verify deployment
molecule verify -s default

# Clean up
molecule destroy -s default
```

## Test Sequence

Each scenario follows this test sequence:

1. **dependency**: Install dependencies
2. **lint**: Run linters (yamllint, ansible-lint)
3. **cleanup**: Clean up any leftover resources
4. **destroy**: Ensure clean slate
5. **syntax**: Check playbook syntax
6. **create**: Create test resources
7. **prepare**: Prepare the environment
8. **converge**: Run the role
9. **idempotence**: Test role idempotence
10. **verify**: Verify the deployment
11. **cleanup**: Clean up resources
12. **destroy**: Final cleanup

## Environment Variables

You can customize the tests using environment variables:

```bash
# Use a specific OpenShift project
export NAMESPACE_SUFFIX=mytest
molecule test -s default

# Use a real Vault server
export VAULT_ADDR=https://vault.example.com:8200
export VAULT_TOKEN=hvs.my-vault-token
molecule test -s production
```

## Test Customization

Each scenario has its own configuration files:

- `molecule.yml`: Scenario configuration
- `converge.yml`: Role execution playbook
- `prepare.yml`: Environment preparation
- `verify.yml`: Deployment verification
- `cleanup.yml`: Resource cleanup

## Adding New Tests

To add a new test scenario:

1. Create a new directory under `molecule/`
2. Copy the basic structure from an existing scenario
3. Customize the configuration for your test case
4. Run with `molecule test -s your-scenario-name`