{% from "aegir/map.jinja" import aegir with context %}

{% set patches = aegir.hostmaster.patches %}

{% for patch, params in patches.items() %}
aegir_apply_patch_{{ patch }}:
  cmd.run:
    - name: /usr/bin/curl {{ params.source }} | /usr/bin/patch {{ params.args | default('') }}
    - cwd: {{ params.path | default('/') }}
    - unless: {{ params.verification }}
{% endfor %}
