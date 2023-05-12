networking
=========

This role set networking using Netplan. 


**Workflow**
Netplan config file is updated. If there were any changes from the previous version, the old file is backed up and Ansible calls handler named `Networking - netplan apply` to apply new changes. 


Requirements
------------

- OS has to use Netplan for its network configuration (default in Ubuntu server).



Role Variables
--------------

| Variable          | Required | Default | Comments   |
|-------------------|----------|---------|------------|
| netplan | yes | N/A | See any server defined in host_vars folder for an example.


Dependencies
------------
N/A


Example Playbook
----------------

```
- name: Set networking
  hosts: hosts
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: networking, tags: ['always']}
```
