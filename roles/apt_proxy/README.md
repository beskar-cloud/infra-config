apt_proxy
=========

This role configures apt proxy for machine

Requirements
------------




Role Variables
--------------
| Variable          | Required | Default | Comments                                               |
|-------------------|----------|---------|--------------------------------------------------------|
| apt_proxy_file | no | 00proxy | |
| apt_proxy_http_chain | no | "" | http path to proxy |
| apt_proxy_https_chain | no | "" | https path to proxy |


Dependencies
------------



Example Playbook
----------------

```
- name: APT Proxy configuration
  hosts: hosts
  connection: ssh
  roles:
    # Validate
    - { role: cli_validation, tags: ['always'] }
    - { role: apt_proxy, tags: ['always'] }
```
