pci_passthrough
=========

This role sets up pci passthrough on target host which has machine_role pci_passthrough.


**Workflow**


Requirements
------------




Role Variables
--------------
| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| pci_pass_force_reboot | yes | false | if system should be rebooted |



Dependencies
------------



Example Playbook
----------------

```
- name: Set up pci passthrough
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: pci_passthrough, tags: ['always'], force_reboot: true }
```
