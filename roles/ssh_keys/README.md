ssh-keys
=========

This role manages public ssh keys.

**Workflow**

The role generates a file (using a template and variables), which is used as the `authorized_keys` file on the host.


Requirements
------------

Have at least one public key specified in `group_vars/all.yml` under the variable `common_ssh_keys`.


Role Variables
--------------

| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| `common_ssh_keys` | yes       | _N/A_   | List of public keys used on the entire infrastructure. |
| `group_ssh_keys`  | no       | _N/A_   | List of group-specific public keys.                    |
| `host_ssh_keys`   | no       | _N/A_   | List of host-specific public keys.                     |


Dependencies
------------

None


Example Playbook
----------------

```
- name: Update ssh keys
  hosts: stage
  connection: ssh
  roles:
    # Validate
    - { role: cli-validation, tags: ['always'] }
    - { role: ssh-keys, tags: ['always'] }
```
