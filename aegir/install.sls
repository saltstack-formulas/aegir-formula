{% from "aegir/map.jinja" import aegir with context %}

{%- if grains.os_family == 'Debian' and aegir.use_upstream_repo -%}
aegir_hostmaster_debconf:
  debconf.set:
    - name: aegir3-hostmaster
    - data:
        'aegir/site': {'type': 'string', 'value': '{{ aegir.hostmaster.site }}'}
        'aegir/db_host': {'type': 'string', 'value': '{{ aegir.hostmaster.db_host }}'}
        'aegir/db_user': {'type': 'string', 'value': '{{ aegir.hostmaster.db_user }}'}
        'aegir/db_password': {'type': 'string', 'value': '{{ aegir.hostmaster.db_password }}'}
        'aegir/email': {'type': 'string', 'value': '{{ aegir.hostmaster.email }}'}
        'aegir/webserver': {'type': 'string', 'value': '{{ aegir.hostmaster.webserver }}'}

aegir:
  pkg.installed:
    - name: {{ aegir.pkg }}
    - require:
      - user: aegir_user
      - pkgrepo: aegir_repo
      - file: aegir_apt_preferences
      - pkg: aegir_keyring
      - debconf: aegir_hostmaster_debconf
{%- else %}
{%- endif %}
