# Contributing to IBM MQ on OpenShift Role

This document provides guidelines for contributing to the IBM MQ on OpenShift Ansible role. Following these guidelines helps ensure that the role remains maintainable, consistent, and high-quality.

## Table of Contents

- [Contributing to IBM MQ on OpenShift Role](#contributing-to-ibm-mq-on-openshift-role)
  - [Table of Contents](#table-of-contents)
  - [Role Structure](#role-structure)
  - [Development Workflow](#development-workflow)
  - [Coding Standards](#coding-standards)
  - [Testing](#testing)
  - [Documentation](#documentation)
  - [Version Control](#version-control)
  - [Review Process](#review-process)
  - [Task Ownership Matrix](#task-ownership-matrix)

## Role Structure

The role follows a modular structure with separate task files for different components:

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

When adding new functionality:
- Create a new task file if it represents a distinct component
- Update the main.yml file to include the new task file
- Add appropriate tags to the include_tasks statement
- Add any new variables to defaults/main.yml with documentation

## Development Workflow

1. **Feature Branches**: Create a feature branch for each new feature or bug fix
   ```
   git checkout -b feature/add-tls-support
   ```

2. **Local Testing**: Test your changes locally using the test playbook
   ```
   cd tests
   ansible-playbook test.yml
   ```

3. **Pull Requests**: Submit a pull request with your changes
   - Include a clear description of the changes
   - Reference any related issues
   - Ensure all tests pass

4. **Code Review**: At least one team member must review and approve the changes

5. **Merge**: After approval, changes can be merged to the main branch

## Coding Standards

1. **YAML Formatting**:
   - Use 2 spaces for indentation
   - Keep lines under 120 characters
   - Use consistent quoting (prefer single quotes for strings)

2. **Variable Naming**:
   - Use snake_case for variable names
   - Prefix role-specific variables with `mq_`
   - Use descriptive names that indicate purpose

3. **Task Naming**:
   - Use clear, descriptive names for tasks
   - Start with a verb (Create, Update, Delete, etc.)
   - Include the component being affected

4. **Comments**:
   - Add comments for complex logic
   - Document the purpose of each task file at the top
   - Explain any non-obvious choices

5. **Idempotency**:
   - Ensure all tasks are idempotent
   - Use `state: present` rather than `state: latest` when possible
   - Check if resources exist before creating them

## Testing

1. **Local Testing**:
   - Test changes locally before submitting a pull request
   - Use the test playbook in the tests directory

2. **Test Scenarios**:
   - Test with different variable combinations
   - Test upgrades from previous versions
   - Test with and without optional features enabled

3. **Validation**:
   - Verify that IBM MQ is properly deployed and functional
   - Check that all components are created correctly
   - Ensure Vault integration works as expected

## Documentation

1. **Variable Documentation**:
   - Document all variables in defaults/main.yml
   - Include description, type, and default value
   - Group related variables together

2. **README Updates**:
   - Update README.md with any new features or changes
   - Keep examples up to date
   - Document any breaking changes

3. **Inline Documentation**:
   - Add comments to explain complex logic
   - Document the purpose of each task file
   - Include references to external documentation when relevant

## Version Control

1. **Commit Messages**:
   - Use clear, descriptive commit messages
   - Start with a verb in the present tense
   - Reference issues when applicable

2. **Branching Strategy**:
   - `main`: Stable, production-ready code
   - `feature/*`: New features or enhancements
   - `bugfix/*`: Bug fixes
   - `release/*`: Release preparation

3. **Versioning**:
   - Follow semantic versioning (MAJOR.MINOR.PATCH)
   - Update version in meta/main.yml when releasing

## Review Process

1. **Pull Request Review**:
   - Check for adherence to coding standards
   - Verify that tests pass
   - Ensure documentation is updated
   - Confirm that changes are idempotent

2. **Approval Requirements**:
   - At least one team member must approve changes
   - CI/CD tests must pass
   - All review comments must be addressed

3. **Merge Process**:
   - Squash commits if necessary for a clean history
   - Merge using pull request in the repository interface
   - Delete feature branch after merging

## Task Ownership Matrix

This matrix defines primary and secondary owners for each component of the role. The primary owner is responsible for maintaining and reviewing changes to that component, while secondary owners provide backup and additional expertise.

| Component | Primary Owner | Secondary Owner | Description |
|-----------|--------------|-----------------|-------------|
| Vault Integration | @security-lead | @devops-lead | Hashicorp Vault integration for credentials |
| OpenShift Configuration | @openshift-lead | @platform-lead | OpenShift-specific configurations |
| MQ Deployment | @mq-lead | @app-lead | IBM MQ deployment and configuration |
| Networking | @network-lead | @platform-lead | Services and routes |
| Storage | @storage-lead | @platform-lead | Persistent volume claims |
| Documentation | @docs-lead | All | Role documentation |
| Testing | @qa-lead | All | Test cases and validation |

When making changes to a component, consult with the primary owner and include them in the review process.

By following these guidelines, we can maintain a high-quality, maintainable Ansible role that can be effectively developed and maintained by a team.