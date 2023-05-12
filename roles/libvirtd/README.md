libvirtd
=========

## This role is deprecated.

This role installs libvirtd packages and performs basic checks on virtualization and libvirtd requirements.

**Workflow**



Requirements
------------




Role Variables
--------------

| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| libvirtd_packages | yes | qemu-kvm,libvirt-daemon-system,virtinst,libvirt-clients,bridge-utils,libvirt-daemon | |
| libvirtd_images_folder | yes | `/opt/infra-config/vm-images` | Where images will be stored |
| libvirtd_default_image | yes | | Default OS image used for VM |


Dependencies
------------



Example Playbook
----------------

```
- name: Install libvirtd
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: libvirtd, tags: ['always'] }
```
