# Makefile for IBM MQ on OpenShift deployment
#
# This Makefile provides shortcuts for common operations.

.PHONY: deploy-dev deploy-prod undeploy-dev undeploy-prod validate lint test

# Default target
all: lint deploy-dev

# Deploy to development environment
deploy-dev:
	ansible-playbook -i inventory/development site.yml

# Deploy to production environment
deploy-prod:
	ansible-playbook -i inventory/production site.yml

# Undeploy from development environment
undeploy-dev:
	ansible-playbook -i inventory/development undeploy.yml

# Undeploy from production environment
undeploy-prod:
	ansible-playbook -i inventory/production undeploy.yml

# Validate the deployment
validate:
	ansible-playbook -i inventory validate.yml

# Lint the role
lint:
	ansible-lint roles/mq-ocp

# Run tests
test:
	cd roles/mq-ocp && molecule test