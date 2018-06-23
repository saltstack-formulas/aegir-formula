{% from "aegir/map.jinja" import aegir with context %}

aegir_user:
  user.present:
    - name: {{ aegir.user }}
    - fullname: AEgir user
    - system: true
    - shell: {{ aegir.shell }}
    - home: {{ aegir.homedir }}

