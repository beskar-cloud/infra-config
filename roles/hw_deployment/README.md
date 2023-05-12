hw_deployment
=========

This role performs operations that are required to complete hypervisor installation after automated deployment.


**Workflow**



Requirements
------------

Newly installed operating system (Ubuntu system is preferred, all debian-based systems should work).



Role Variables
--------------
N/A


Dependencies
------------
N/A


Example Playbook
----------------

```
---

- name: Provision a hypervisor
  hosts: hosts
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: hw_deployment, tags: ['always'], become: true }
```
