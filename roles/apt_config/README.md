apt_config
===========

Description
-----------

The `apt_config` Ansible role is designed to manage the Advanced Package Tool (APT) configuration on Ubuntu servers. It allows you to set custom APT configurations and add specific APT repositories to the system. Additionally, the role enables you to install a list of required packages.

The `apt_config_content` variable allows you to set custom APT configuration options. It is used to generate the `/etc/apt/apt.conf.d/99custom` file on the target servers.

The `apt_repositories` variable allows you to specify custom APT repositories that you want to add to the target servers. Each entry in the list defines a custom repository with the repo key containing the repository URL.

Requirements
------------

- The role assumes that the servers are Ubuntu-based.
- Make sure you have SSH access to the target servers.

Role Variables
--------------

The `apt_config_role` role utilizes the following variables defined in `group_vars/all.yml`:

```
apt_config_content: |
  # This file is managed remotely, all changes will be lost
  APT::Periodic::Unattended-Upgrade "0";
  APT::Periodic::Update-Package-Lists "1";
  APT::Periodic::Download-Upgradeable-Packages "0";
  APT::Periodic::Download-Upgradeable-Packages "0";
  Acquire::http::Proxy "false";

apt_repositories:
  - repo: 'deb http://packages.itera.io/ubuntu jammy-backports main restricted universe multiverse'
  - repo: 'deb http://packages.itera.io/ubuntu-security jammy-security main restricted universe multiverse'
  - repo: 'deb http://packages.itera.io/ubuntu jammy-updates main restricted universe multiverse'
  - repo: 'deb http://packages.itera.io/ubuntu jammy main restricted universe multiverse'

apt_packages:
  - linux-tools-common
  - linux-cloud-tools-generic
  - linux-tools-generic
  - numactl
```
