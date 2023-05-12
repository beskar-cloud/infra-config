hostname
=========

This role sets hostname on specified host. 

**Workflow**
The hostname is generated from the `inventory_hostname` by taking the string until the first occurrence of `.`.


Requirements
------------
N/A


Role Variables
--------------
N/A


Dependencies
------------
N/A


Example Playbook
----------------

```
- name: Update hostname
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: hostname, tags: ['always'] }
```
