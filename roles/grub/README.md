grub
=========

This role allows custom modifications to grub



Requirements
------------
N/A

Tags
--------------
| Tag | Behavior |
|-----|----------|
| reboot | Reboot servers |


Role Variables
--------------
| Variable          | Required | Default | Comments |
|-------------------|----------|---------|----------|
| cgroupsv2_disabled | no | N/A | use `cgroupsv2_disabled: true` to disable cgroups v2 |


```
cgroupsv2_disabled: true
```


Dependencies
------------
N/A

Example Playbook
----------------

```
- name: Manage GRUB
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: grub}
```
