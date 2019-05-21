requirements:
  pkg.installed:
    - pkgs:
        - python3-yaml
        - python3-requests

home:
  file.directory:
    - name: /root/.jumpcloud-notify
    - user: root
    - group: root
    - mode: 500

config:
  file.managed:
    - name: /etc/jumpcloud-notify.yaml
    - mode: 600
    - contents: |
        {{ salt.pillar.get('jumpcloud-notify', {}) | yaml(False) | indent(8) }}

binary:
  file.managed:
    - name: /usr/bin/jumpcloud-notify
    - mode: 755
    - source: salt://jumpcloud-notify/jumpcloud-notify

service:
  file.managed:
    - name: /etc/systemd/system/jumpcloud-notify.service
    - mode: 644
    - source: salt://jumpcloud-notify/jumpcloud-notify.service
    - require:
        - file: binary
        - file: config
        - file: home
        - pkg: requirements

jumpcloud-notify:
  service.running:
    - enable: True
    - require:
        - file: service
    - watch:
        - file: binary
        - file: config
        - file: home
