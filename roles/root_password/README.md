root_password
=========
This Ansible role is used to update the root account password on Ubuntu servers.

Requirements
------------
- The role assumes that the servers are Ubuntu-based.
- Make sure you have SSH access to the target servers.

Role Variables
--------------
In group_vars/all.yml set the `root_password` variable. Replace `your_root_password_here` with the desired root password. The role will use this password to update the root account on the target servers.

Dependencies
------------

 N/A

Example Playbook
----------------

```
---
- name: Update Root Password on Ubuntu Server
  hosts: your_ubuntu_server
  gather_facts: false
  become: yes

  roles:
    - role: update_root_password
```
Make sure to replace your_ubuntu_server with the actual hostname or IP address of your server.


Note
----
- Make sure to keep the `root_password` variable encrypted (for instance via ansible-vault (currently in group_vars/all.yml).
- Verify that you have proper SSH access and privilege escalation (sudo) rights on the target servers.
