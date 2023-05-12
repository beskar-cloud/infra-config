ipv6
=========



**Workflow**




Requirements
------------



Role Variables
--------------

| Variable          | Required | Default | Comments                                                         |
|-------------------|----------|---------|------------------------------------------------------------------|
| ensure_state      | yes      | present | `present` disables ipv6 on host, `absent` removes the configuration. |




Dependencies
------------


Example Playbook
----------------


```
- name: Configure/disable ipv6
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: ipv6, tags: ['always'] }
```

```
- name: Configure/disable ipv6
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: ipv6, tags: ['always'], ensure_state: absent }
```
