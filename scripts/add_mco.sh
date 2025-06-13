#!/bin/bash

oc apply -f=- <<EOF
variant: openshift
version: 4.18.0
metadata:
  name: 00-worker-ibm-kernel-devel-kdump
  labels:
    machineconfiguration.openshift.io/role: worker
openshift:
  extensions:
    - kernel-devel
  kernel_arguments:
    - crashkernel=4096M
storage:
  files:
    - path: /etc/kdump.conf
      mode: 0644
      overwrite: true
      contents:
        inline: |
          path /var/crash
          core_collector makedumpfile -l --message-level 7 -d 31

    - path: /etc/sysconfig/kdump
      mode: 0644
      overwrite: true
      contents:
        inline: |
          KDUMP_COMMANDLINE_REMOVE="hugepages hugepagesz slub_debug quiet log_buf_len swiotlb"
          KDUMP_COMMANDLINE_APPEND="irqpoll nr_cpus=1 reset_devices cgroup_disable=memory mce=off numa=off udev.children-max=2 panic=10 rootflags=nofail acpi_no_memhotplug transparent_hugepage=never nokaslr novmcoredd hest_disable"
          KEXEC_ARGS="-s"
          KDUMP_IMG="vmlinuz"

systemd:
  units:
    - name: kdump.service
      enabled: true
EOF
