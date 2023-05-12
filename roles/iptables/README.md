ipv6
=========



**Workflow**




Requirements
------------

Currently deploy only on controlplane node, because we are not sure about iptables (nftables, used here also for kubernetes) and iptables-legacy (used by openvswitch on compute nodes) behavior.

`ansible-playbook play_single_iptables.yml -i ansible_hosts_brno -l brno_controlplane --become`



Role Variables
--------------

| Variable            | Required | Default       | Comments                                                |
|---------------------|----------|---------------|---------------------------------------------------------|
| ensure_state        | yes      | present       | Set `present` to ensure iptables are configured and `absent` to ensure ansible iptables rule are removed. |
| iptables4_save_file | yes      | "/etc/iptables/rules.v4" | path to default iptables v4 persistent rules |
| iptables6_save_file | yes      | "/etc/iptables/rules.v6" | path to default iptables v6 persistent rules |



Dependencies
------------


Example Playbook
----------------


```
- name: Configure/setup iptables
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: iptables, tags: ['always'] }
```

```
- name: Configure/setup iptables
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: iptables, tags: ['always'], ensure_state: absent }
```
