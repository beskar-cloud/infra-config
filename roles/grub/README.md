grub
=========

This role allows custom modifications to grub configure HugePages settings on Ubuntu servers. It allows you to apply specific parameters to improve system performance and efficiently manage HugePages.


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
| `grub_config.cmdline_linux_default` | no | N/A | `['iommu=pt', 'intel_iommu=on', 'default_hugepagesz=2M', 'transparent_hugepage=never', 'hugepages=512', 'hugepagesz=2M']` | List of GRUB kernel command line options. You can customize this list to add or modify kernel command line options for GRUB. |


```
cgroupsv2_disabled: true
```

```
grub_config:
  cmdline_linux_default:
    - 'iommu=pt'
    - 'intel_iommu=on'
    - 'default_hugepagesz=2M'
    - 'transparent_hugepage=never'
    - 'hugepages=512'
    - 'hugepagesz=2M'

```

The `grub_config` variable allows you to specify various parameters to be added to the `GRUB_CMDLINE_LINUX_DEFAULT` option in the `/etc/default/grub` file. These parameters are designed to optimize system performance and hardware support.


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
