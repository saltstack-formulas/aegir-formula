{% from "aegir/map.jinja" import aegir with context %}

aegir_user:
  user.present:
    - name: {{ aegir.user }}
    - fullname: AEgir user
    - system: true
    - shell: {{ aegir.shell }}
    - home: {{ aegir.homedir }}
    - groups: 
      - {{ aegir.webserver_group }}

aegir_homedir:
  file.directory:
    - name: {{ aegir.homedir }}
    - user: {{ aegir.user }}
    - group: {{ aegir.user }}
    - mode: {{ aegir.homedir_mode }}
    - makedirs: true
    - require:
      - user: aegir_user
