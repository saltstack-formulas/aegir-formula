{% from "aegir/map.jinja" import aegir with context %}

include:
  - aegir.install

aegir_hostmaster:
  service.running:
    - name: {{ aegir.hostmaster.service }}
    - enable: true
    - require:
      - pkg: aegir


