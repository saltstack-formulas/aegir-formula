{% from "aegir/map.jinja" import aegir with context %}

{% set modules = aegir.hostmaster.modules %}

{% for module, args in modules.items() %}
  {% set mod_sites = args.sites | default(['hostmaster']) %}
  {% for site in mod_sites %}
    {% set install_cmd = args.install_command if args.install_command is defined else 'drush @' ~ site ~ ' pm-enable -y ' ~ module %}
    {% set test_cmd = args.test_command if args.test_command is defined else 'drush @' ~ site ~ ' pm-info --fields=status ' ~ module ~ ' | grep "Status   :  enabled"' %}

    {% if args.url is defined %}
aegir_get_module_{{ module }}_{{ site }}:
  git.latest:
    - name: {{ args.url }}
    - user: {{ aegir.user }}
    - branch: {{ args.branch | default('master') }}
    - rev: {{ args.branch | default('master') }}
    - target: {{ args.target }}
    - require_in:
      - cmd: aegir_install_module_{{ module }}_{{ site }}
    {% endif %}

aegir_install_module_{{ module }}_{{ site }}:
  cmd.run:
    - name: '{{ install_cmd }}'
    - runas: {{ aegir.user }}
    - unless: '{{ test_cmd }}'
  {% endfor %}
{% endfor %}
