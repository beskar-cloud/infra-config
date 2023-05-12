dns
=========

This role manages DNS entries for `cloud.democluster.dev`

Usage
-----

To manage DNS entries (excluding hypervisors) use the virtual machine and `dns` group:

```shell
ansible-playbook  -i ./ansible_hosts_brno -l dns play_single_dns.yml --tags dns-create
``` 

Requirements
------------
N/A


Role Variables
--------------
N/A


Dependencies
------------
N/A

Example Playbook
----------------

```
- name: Manage DNS 
  hosts: hosts
  connection: local
  gather_facts: False
  roles:
    - { role: cli_validation, tags: ['always'] }
    - { role: dns, tags: [ 'never', 'dns-create' ], dns_state: present }
```
