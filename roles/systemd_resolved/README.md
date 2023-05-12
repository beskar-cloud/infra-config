systemd_resolved
=========

This role manages sytemd_resolved configuration.


Requirements
------------
N/A


Role Variables
--------------
| Variable          | Required | Default | Comments |
|-------------------|----------|---------|----------|
| dns.main | no | N/A | Main DNS server to forward DNS requests to |
| dns.fallback | no | N/A | Fallback DNS |

If no variable is defines, the default resolved.conf file for Ubuntu 22.04 is used.

```
dns:
  main: 8.8.8.8
  fallback: 1.1.1.1
```


Dependencies
------------
N/A

Example Playbook
----------------

```
---

- name: Manage systemd_resolved
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: systemd_resolved, tags: ['always'] }

```
