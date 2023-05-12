shell
=========

This role configures the shell:
  * bash prompt `$PS1` of users `root` and `ubuntu` is in format `[<username>@<hostname> <env> <working_directory_name> <exit_code>]$ `



Requirements
------------

N/A


Role Variables
--------------

| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| bash_root_ps1 | no |  '[\u@\h production \W $?]\$ ' | \u is red |
| bash_nonroot_ps1 | no |  '[\u@\h production \W $?]\$ ' | \u is yellow |


Dependencies
------------

N/A


Example Playbook
----------------

```
- name: Update PS1
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: shell, tags: ['always'] }
```
