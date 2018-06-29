{% from "aegir/map.jinja" import aegir with context %}

aegir_user:
  user.present:
    - name: {{ aegir.user }}
    - fullname: AEgir user
    - system: true
    - shell: {{ aegir.shell }}
    - home: {{ aegir.homedir }}
    - user_dir_mode: {{ aegir.homedir_mode }}
    - groups: 
        - {{ aegir.webserver_group }}
