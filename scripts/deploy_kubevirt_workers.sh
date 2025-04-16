#!/usr/bin/env ansible-playbook
---
- name: Deploy KubeVirt Workers
  ansible.builtin.import_playbook: ../ansible/deploy_kubevirt_workers.yml
