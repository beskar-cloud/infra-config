systemd_timesyncd
=========

This role installs `systemd-timesyncd` package and configures its fallback servers.

**Workflow**



Requirements
------------

N/A


Role Variables
--------------

| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| ntp_hosts | | [] | |
| fallback_ntp_hosts | list of ntp hosts | |


Dependencies
------------

N/A

Example Playbook
----------------

```
- name: Update timesyncd
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: systemd_timesyncd, tags: ['always'] }
```
