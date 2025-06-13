#!/usr/bin/env ansible-playbook
---
- name: Add Security Group Rules for IBM Fusion
  ansible.builtin.import_playbook: ../ansible/set_sg_rules.yml
