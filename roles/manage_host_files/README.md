manage_host_files
=========

The `manage_host_files` Ansible role is designed to manage files on target hosts, providing flexibility to create, update, or remove files based on the specified configuration. It is particularly useful for tasks such as configuring system files or managing specific application configurations.

Requirements
------------
- The role assumes that the servers are Ubuntu-based.
- Make sure you have SSH access to the target servers.


Role Variables
--------------

The `manage_host_files` role uses the following variables defined in `roles/manage_host_files/defaults/main.yml`.You can further customize these variables for specific groups of hosts by utilizing the `group_vars` feature. For example, if you have a group named `democluster_k8s_vms` you can create a `group_vars/democluster_k8s_vms/main.yml file with content like this:

```
files_to_manage:
  - path: /etc/demo.txt
    state: present
    content: |
      This is a special configuration file for specific group of hosts.
```


| Variable          | Required | Default | Comments                                                                |
|-------------------|----------|---------|-------------------------------------------------------------------------|
| `files_to_manage` | No       | []      | List of dictionaries specifying files to be managed. See details below. |


## `files_to_manage`

This variable is a list of dictionaries specifying files to be managed. Each dictionary should contain the following keys:

- `path`: The path to the file on the target host.
- `mode` (optional): The file permissions (default is "0644").
- `state`: The state of the file ("present" or "absent").
- `content`: The content of the file (used when `state` is "present").

Dependencies
------------

N/A

Example Playbook
----------------

```
---
- name: Manage host files
  hosts: hosts
  connection: ssh
  roles:
    - { role: cli_validation, tags: ['always'] }
    - { role: manage_host_files, tags: ['always']}
```
