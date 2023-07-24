Role: libvirt
=====================

Description
-----------
The `libvirt` Ansible role is designed to manage the installation and configuration of the Libvirt virtualization daemon on Ubuntu servers. It allows you to customize the Libvirt host configuration and set up required packages for virtualization.

Requirements
------------
Before using this role, ensure the following requirements are met:

- **Operating System**: The role is designed for Ubuntu-based servers. Ensure that your target servers are running Ubuntu.

- **SSH Access**: Make sure you have SSH access to the target servers. This role requires privilege escalation (`become: true`) to modify system files.

Role Variables
--------------
The `libvirt` role utilizes the following variables defined in `group_vars/k8s-vms/main.yml`:

```
libvirtd_qemu_host_configuration:
  security_driver: "none"
```
Default variables defined in roles/libvirt/defaults/main.yml:

```
libvirtd_enabled: true

libvirt_packages:
  - libvirt-clients
  - qemu-utils
  - qemu-kvm
  - libvirt-daemon-system
```
