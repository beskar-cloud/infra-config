systemd_service_manager
========================

This Ansible role manages systemd services on target hosts. It enables, disables, and creates new systemd services based on the provided configuration.

Requirements
------------
N/A

Role Variables
--------------

| Variable          | Required | Default |                                        Comments                                               |
|-------------------|----------|---------|-----------------------------------------------------------------------------------------------|
| `systemd_units`   |   yes    |   N/A   | A list of dictionaries containing configurations for systemd services. See below for details. |

## `systemd_units` (list)

A list of dictionaries containing configurations for systemd services.

Each dictionary contains the following keys:

- `name` (string): The name of the systemd service.
- `raw` (string): The raw systemd unit configuration for the service.
- `state` (string): The desired state of the service (`started`, `stopped`, `restarted` and `absent` ).
- `enabled` (boolean): Whether the service should be enabled (`true` or `false`).

Note:
-----
- `state: absent` removes service files from the host

Example:
--------
```yaml
systemd_units:
# Define new systemd services
  - name: 'demo_service_1'
    raw: |
      [Unit]
      Description=Always Running Test Service

      [Service]
      Type=simple
      ExecStart=/bin/sleep infinity

      [Install]
      WantedBy=multi-user.target
    state: 'started'
    enabled: true
  - name: 'demo_service_2'
    raw: |
      [Unit]
      Description=Always Running Test Service

      [Service]
      Type=simple
      ExecStart=/bin/sleep infinity

      [Install]
      WantedBy=multi-user.target
    state: 'absent'
    enabled: true

# Manage existing services
  - name: 'apparmor'
    state: 'stopped'
    enabled: false
```
Dependencies
------------
N/A

Example Playbook
----------------

```
- name: Create, enable and disable systemd services
  hosts: hosts
  become: yes
  roles:
    - { role: cli_validation, tags: ['always']}
    - { role: systemd_service_manager, tags: ['always']}
```
