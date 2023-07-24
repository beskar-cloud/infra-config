sysctl_config
==================

Description
-----------
This Ansible role is used to manage the sysctl parameters on Ubuntu servers. It allows you to set various kernel and network-related parameters to optimize the system's performance and behavior.

Requirements
------------
- The role assumes that the servers are Ubuntu-based.
- Make sure you have SSH access to the target servers.

Role Variables
--------------
The role uses the following variable in `group_vars/all.yml`:

```
sysctl_parameters: |
  fs.file-max = 1000000
  fs.inotify.max_queued_events = 524288
  fs.inotify.max_user_instances = 100000
  fs.inotify.max_user_watches = 100000
  kernel.nmi_watchdog = 1
  kernel.pid_max = 4194303
  kernel.threads-max = 2097152
  net.core.somaxconn = 32768
  net.ipv4.tcp_mem = 4096 87380 16777216
  net.ipv4.tcp_max_syn_backlog = 8192
  net.ipv4.tcp_rmem = 4096 87380 134217728
  net.ipv4.tcp_tw_reuse = 1
  net.ipv4.tcp_wmem = 4096 87380 134217728
  vm.dirty_background_ratio = 3
  vm.dirty_ratio = 10
  vm.min_free_kbytes = 4194303
  vm.vfs_cache_pressure = 50
  vm.zone_reclaim_mode = 0
  fs.aio-max-nr = 262144
```
