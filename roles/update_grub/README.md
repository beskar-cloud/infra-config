update_grub
=================

Description
-----------
The `update_grub` Ansible role is designed to manage the GRUB (Grand Unified Bootloader) configuration and configure HugePages settings on Ubuntu servers. It allows you to apply specific parameters to improve system performance and efficiently manage HugePages.

Requirements
------------
Before using this role, ensure the following requirements are met:

- The role assumes that the target servers are running Ubuntu.
- Make sure you have SSH access to the target servers.

Role Variables
--------------

| Variable                            | Required | Default                                                                                                                   | Comments |
|-------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------|----------|
| `grub_config.cmdline_linux_default` |    No    | `['iommu=pt', 'intel_iommu=on', 'default_hugepagesz=2M', 'transparent_hugepage=never', 'hugepages=512', 'hugepagesz=2M']` | List of GRUB kernel command line options. You can customize this list to add or modify kernel command line options for GRUB. |

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

