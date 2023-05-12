hosts_file
=========

This role generates the `/etc/hosts` file.

**Workflow**

Generating the *hosts* file has two phases.

Generate custom entries specified by the `custom_hosts_entries` variable.
Generate entries for all servers defined in the host_vars folder that have the variable `ip_data` defined.


Requirements
------------
N/A


Role Variables
--------------
| Variable          | Required | Default | Comments |
|-------------------|----------|---------|----------|
| k8s_config.hostnames | no | N/A | example: `[controlplane-001.cluster.prod-brno, controlplane-001]` |
| custom_hosts_entries | no | N/A | Creates custom hosts file entries on all servers. See below for an example. |

```
custom_hosts_entries:
  - ip_address: 8.8.8.8
    hosts: ["example.cz", "example.com"]
```


Dependencies
------------
N/A

Example Playbook
----------------

```
- name: Manage hosts file
  hosts: hosts
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: hosts_file, tags: ['always'] }
```
