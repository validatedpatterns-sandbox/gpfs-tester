#!/usr/bin/env ansible-playbook
---
- name: Add EBS volumes to workers
  ansible.builtin.import_playbook: ../ansible/set_ebs_volumes.yml
