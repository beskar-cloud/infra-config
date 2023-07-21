user_management
=====================

Description:
------------
This Ansible role is used to manage user accounts on Ubuntu servers. It creates user accounts, adds them to the 'admins' group with passwordless sudo access, sets their SSH public keys, and deletes user directories if the user state is set to 'absent'.

Requirements:
--------------
- The role assumes that the servers are Ubuntu-based.
- Make sure you have SSH access to the target servers.

Role Variables:
---------------
The role defines the following variable in the `group_vars/all.yml` file:

```
system_users__accounts:
  - name: 'demo1'
    admin: True
    shell: '/bin/bash'
    state: present
    sshkeys: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDM/okx/jbbt3/EkUC15ciUc81WpO3vHFqazrS+jPTYKILYa2B07hJVg99nYveNYuEp2BYWYbLULo4YZCnqbB9Kx3gpX0iMwvKzfkvt/M3uWEAm6hx1sT2QZM5sXbDAg/azOk5HBJ9bZGpPQncE9msdnM8TrPnp7zY7ExZqTIloTiPSkNFmZnKU4hxxBQwU8Mo2BKEOjihR0lCoGC8A2aARjJC7dX4p+jmfIg2kcRBUS/5SpAXZTanDM4fPhuvH9GFbJRtt8d6xo7wU40U6lcPXvmgAnCqmk0WCyji74xS1+ToHyvAVFS0MTRKvXV9qNBGFmik3SZUxypnsb3ujQbrOuxbHv+2yAqYVJfv5Yvncq/Ph0WTrSgTLwEmU3M+Gq5zdzDN82JD33UOLJDx04HAjWaO3zIyjRUguU5gMNqDc12wiZ495/0rotG0awaewergaYJJHwudHaWqMzG2+dIuZhBV++Gxpqtf6sdawadssdawwpe4fbjiiMc= root@demo1"

  - name: 'demo2'
    admin: true
    shell: '/bin/bash'
    state: present
    sshkeys: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYVr0FcJcH3bMgS9t69/MNfdGE7l8XkpbwnjgC7oTZ5xuLMB+4uFXu2bIi2GecX13cyFlSl2Z/4wTcNbv3pNDr14ovelLdMMD/ph43cP/0+YDbgFqq7XQrTYPY/rBXsYJx88pPSXAphkIYkHpxyKrH1RzXySjZdb9G3C8uZ9e3UE7YXUrR8aqcgjNZnqK/sE56Diosst0ZM7A8NZzSUtYKtTd/tBskzIFoz5ZvQ4c+3QOlAddkSiyEJ7rVctiSTEd5Nc4psznfNV4fjXM4QNmt+elEs5xveU2GRM9822QGp57UDhtG+gODvyHpV2ZWe/BmA6iePZ/sdawwpe4fbjiiMc= root@demo2"
```
