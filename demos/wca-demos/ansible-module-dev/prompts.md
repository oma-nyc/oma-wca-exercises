# prompts.md

## synopsis

Pete's prompts for ansible-module-dev demos

## prompts

### oc_route

```txt
Using python, produce a complete Ansible module called oc_route for managing Routes in OpenShift Container Platform version 4. The module should:
* discover the route.openshift.io/v1 plural dynamically,
* support state=present/absent with server-side apply (server-side apply via "apply" patch when available) and patch fallback,
* sanitize server-managed fields for idempotence,
* support check_mode and return diffs (before/after),
* implement retries/backoff for transient HTTP errors,
* support kubeconfig/context/in-cluster auth, verify_ssl, and token params (with no_log where appropriate),
* support wait for route readiness with timeout,
* follow Ansible module conventions (DOCUMENTATION/EXAMPLES/RETURN),
* avoid printing secret data and mark sensitive params no_log.

Use the kubernetes Python client. Do not fall back on using the oc binary if the kubernetes Python client isn't present.
```

#### If needed: Sanitize the following server-side fields

```txt
The module shall remove these server-managed fields:

- metadata.managedFields
- metadata.generation
- metadata.creationTimestamp
- metadata.resourceVersion
- metadata.uid
- metadata.selfLink
- status

Additionally, the module shall strip metadata.annotations entries whose keys start with:

- kubernetes.io/
- openshift.io/

(and drop the annotations map entirely if none remain).
```

#### If needed: Implement the discovery logic

```txt
Implement the discovery logic. The resource name is usually "routes" in route.openshift.io/v1. Use DynamicClient.resources.search or get API resources. DynamicClient.resources has get for (api_version, kind) with plural resolution.
```
