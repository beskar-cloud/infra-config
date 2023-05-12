os_patch
=========

This role manages package updates and restart of services and system.

**Workflow**



Requirements
------------




Role Variables
--------------

| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| patch_action | | update | |
| patch_enabled | | true | |
| patch_apply | | true | |
| patch_service_restart | | true | |
| patch_reboot | | false | |
| package_name | | '*' | |

Dependencies
------------

None

Example Playbook
----------------

```
- name: Patch OS
  hosts: hosts
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: os_patch, tags: ['never', 'update', 'update-only'], patch_action: update }
    - { role: os_patch, tags: ['never', 'update', 'restart-services'], patch_action: restart-services }
    - { role: os_patch, tags: ['never', 'update', 'check-reboot'], patch_action: reboot }
    # Reboot server if reboot is required
    - { role: os_patch, tags: ['never', 'reboot'], patch_action: reboot, patch_reboot: true }
```
