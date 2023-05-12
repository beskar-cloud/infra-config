install_packages
=========

This role installs common packages and also specified packages based on host group, role etc. 



Requirements
------------
N/A



Role Variables
--------------

| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| apt_ipmi_packages | | python3-pip, ipmitool | |
| pip_ipmi_packages | | pyghmi | |
| common_packages | no | _N/A_  | |
| group_packages | no | _N/A_  | |
| host_packages | no | _N/A_  | |

Dependencies
------------
N/A


Example Playbook
----------------

```
- name: Install packages
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: install_packages, tags: ['always'] }
```
