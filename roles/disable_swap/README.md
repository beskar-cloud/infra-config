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

| Variable         | Required | Default   | Comments                                                                             |
|------------------|----------|-----------|--------------------------------------------------------------------------------------|
| mount_devices    | no       | [See below](#default-mount_devices-value)| List of dictionaries specifying swap devices to be disabled in fstab and turned off. Each dictionary should have 'path', 'state', and 'src' keys. |
| swapfile_files   | no       | []        | List of additional swapfile paths to be disabled.                                    |

### Default mount_devices value

```
mount_devices:
  - path: 'none'
    state: 'absent'
    src: '/swap.img'
  - path: 'none'
    state: 'absent'
    src: '/swapfile'
```
### Default swapfile_files value

```
swapfile_files: []
```

- The mount_devices list contains dictionaries that define swap devices to be disabled in the /etc/fstab file and turned off using the swapoff command.
  - The path key specifies the mount path (in this case, 'none' since it's a swap device).
  - The state key specifies whether the device should be absent or not.
  - The src key specifies the source path of the swap device.
- The swapfile_files list allows you to provide additional swapfile paths that need to be disabled. By default, it's an empty list.
