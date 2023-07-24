Role: disable_swap
===================

Description
-----------
The `disable_swap` Ansible role is designed to disable swap on Linux servers. It allows you to remove swap entries from the `/etc/fstab` file and turn off swap with the `swapoff` command.

Requirements
------------
Before using this role, ensure the following requirements are met:

- **Operating System**: The role is designed for Linux-based servers.
- **SSH Access**: Make sure you have SSH access to the target servers. This role requires privilege escalation (`become: true`) to modify system files.

Role Variables
--------------
The `disable_swap` role does not utilize any user-defined variables. It uses the following default variables defined in `roles/disable_swap/defaults/main.yml`:

```
mount_devices:
  - path: 'none'
    state: 'absent'
    src: '/swap.img'
  - path: 'none'
    state: 'absent'
    src: '/swapfile'

swapfile_files: []
```
