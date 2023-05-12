unattended_upgrades
=========

This role configures security updates installing using previously installed unattended-upgrades package.

**Workflow**



Requirements
------------

Installed common packages, package "unattended-upgrades" is in common package list.


Role Variables
--------------

| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| blacklisted_packages | yes | "linux-" | |


Dependencies
------------


Example Playbook
----------------

```
- name: Install unattended upgrades
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: unattended_upgrades, tags: ['always'] }
```
