# Infra-config

## Toolbox
You should launch all commands from the toolbox to make sure you run tested version of required tools.

- launch toolbox: `./toolbox.sh`
- pull *latest* version and launch toolbox: `./toolbox.sh -p`
- pull *\<version\>* version and launch toolbox: `./toolbox.sh -v <version>`

You can find available toolbox versions here: https://gitlab.ics.muni.cz/cloud/g2/g2-toolbox/container_registry/5608


## Using infra-config

### Branches

Use *master* branch for running all playbooks.


### Automated Server Maintenance

To get servers up-to-date with the current infra-config settings you have to use the `play_automated_common.yml` playbook. 

Examples:

```
# Democluster compute nodes
ansible-playbook -i ansible_hosts_democluster -l democluster_compute  play_automated_common.yml

# Ostrava controlplane nodes
ansible-playbook -i ansible_hosts_democluster -l democluster_controlplane play_automated_common.yml
```


### Hypervisor deployment
After installing hypervisor with MAAS, you have to make it up-to-date with infra-config. This requires to run a few playbooks in specific order.

```
# If there is no DNS server on management network, provide custom DNS servers
ansible-playbook -i ansible_hosts_brno -l crf-008-ics.priv.g2.cloud play_single_systemd_resolved.yml 

# Main deployment plabook - MAAS cleanup, infra-config provisioning, ....
ansible-playbook -i ansible_hosts_brno -l crf-008-ics.priv.g2.cloud play_hw_provision.yml 


```


## Playbooks

**Documentation**

Each role is documented in the README.md file located in the role's main folder.


**Naming Convention**

- Use prefix `play_` for all playbooks.
- Use prefix `play_automated_` for playbooks that are mostly run automatically (cron, CI, ...). An example of such playbook is the `play_automated_common.yml` that replaces Puppet.
- Use prefix `play_single_` for single role/task playbooks. There should be one file for each role, named `play_singe_<role_name>.yml`.



Out-of-date:

### `play_single_os_patch.yml`

** Please considder adding migration of VMs to this playbook**

Playbook for controled node system and package updates. Usage:
```
 # Update packages and restart services
 $ ansible-playbook play_single_os_patch.yml -t update -l <host or hostgroup>

 # Update packages, restart services and reboot if necessary
 $ ansible-playbook play_single_os_patch.yml -t update,reboot -l <host or hostgroup>

 # Update packages of hosts with disabled update {through host var `patch_enabled` - for example pm.stage.cloud.muni.cz)
 $ ansible-playbook play_single_os_patch.yml -t update -l <host or hostgroup> -e patch_enabled=true
```

