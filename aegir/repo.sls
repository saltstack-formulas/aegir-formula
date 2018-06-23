# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "aegir/map.jinja" import aegir with context -%}

{%- if grains.os_family == 'Debian' and aegir.use_upstream_repo -%}
aegir_repo:
  pkgrepo.managed:
    - humanname: {{ aegir.repo.humanname }} - {{ aegir.repo.version }}
    - name: deb {{ aegir.repo.url_base }} {{ aegir.repo.version }} main
    - file: {{ aegir.repo.file }}
    - key_url: {{ aegir.repo.key_url }}
    - require_in:
      - file: aegir_apt_preferences
      - pkg: aegir_keyring

aegir_apt_preferences:
  file.managed:
    - name: /etc/apt/preferences.d/aegir
    - mode: '0644'
    - user: root
    - group: root
    - contents:
      - 'Package: *'
      - "{{ 'Pin: origin ' ~ aegir.repo.url_base | replace('http://', '') }}"
      - 'Pin-Priority: 100'
      - 'Explanation: Safety preference for AEgir repo as documented in http://docs.aegirproject.org/en/3.x/install/'

aegir_keyring:
  pkg.installed:
    - name: aegir-archive-keyring
{%- endif %}
