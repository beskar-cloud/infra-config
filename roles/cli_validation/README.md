cli_validation
=========

This role checks if playbooks are runned with -l limit parameter and also warns
if playbook affects more hosts than specified limit.

**Workflow**

Use within other playbooks, e.g.:
```
    # Validate
    - { role: cli_validation, tags: ['always'] }
```

Requirements
------------




Role Variables
--------------
| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| host_limit_warning | no |  1 | |
| cli_validation_skip | no | false | |



Dependencies
------------



Example Playbook
----------------

Used exclusively within other playbooks.
