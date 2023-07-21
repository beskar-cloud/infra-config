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
The `update_grub` role utilizes the following variables defined in custom host group `group_vars/k8s-vms/grub.yml` to update the grub config on specific group of servers depending on host usage:

```
grub_config:
  cmdline_linux_default:
    - 'iommu=pt'
    - 'intel_iommu=on'
    - 'default_hugepagesz=1G'
    - 'transparent_hugepage=never'
    - 'hugepages=20'
    - 'hugepagesz=1G'

nr_hugepages: 25
```

The `grub_config` variable allows you to specify various parameters to be added to the `GRUB_CMDLINE_LINUX_DEFAULT` option in the `/etc/default/grub` file. These parameters are designed to optimize system performance and hardware support.

The `nr_hugepages` variable sets the number of HugePages that will be configured in the `/etc/sysctl.conf` file. HugePages provide significant benefits for certain applications, such as those running on virtual machines or memory-intensive workloads.
