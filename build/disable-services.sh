#!/bin/bash

bl Disabling sshd
rm -rf /etc/service/sshd
rm -f /etc/my_init.d/00_regen_ssh_host_keys.sh
bl sshd disabled

bl Disabling cron
touch /etc/service/cron/down
bl cron disabled