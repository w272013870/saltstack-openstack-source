/etc/nova:
  file.directory:
    - user: root
    - group: root

/var/log/nova:
  file.directory:
    - user: root
    - group: root

/var/run/nova:
  file.directory:
    - user: root
    - group: root

/var/lib/nova:
  file.directory:
    - user: root
    - group: root

/var/lib/nova/instances:
  file.directory:
    - user: root
    - group: root
    - require:
      - file: /var/lib/nova

/etc/nova/rootwrap.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

rootwrap.d:
  file.recurse:
    - name: /etc/nova/rootwrap.d
    - source: salt://openstack/nova/files/rootwrap.d

/etc/nova/api-paste.ini:
  file.managed:
    - source: salt://openstack/nova/files/api-paste.ini
    - mode: 644
    - user: root
    - group: root

/etc/nova/logging.conf:
  file.managed:
    - source: salt://openstack/nova/files/logging.conf
    - mode: 644
    - user: root
    - group: root

/etc/nova/policy.json:
  file.managed:
    - source: salt://openstack/nova/files/policy.json
    - mode: 644
    - user: root
    - group: root

/etc/nova/rootwrap.conf:
  file.managed:
    - source: salt://openstack/nova/files/rootwrap.conf
    - mode: 644
    - user: root
    - group: root

/etc/nova/nova.conf:
  file.managed:
    - source: salt://openstack/nova/files/nova.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      MYSQL_SERVER: {{ pillar['nova']['MYSQL_SERVER'] }}
      NOVA_USER: {{ pillar['nova']['NOVA_USER'] }}
      NOVA_PASS: {{ pillar['nova']['NOVA_PASS'] }}
      NOVA_DBNAME: {{ pillar['nova']['NOVA_DBNAME'] }}
      RABBITMQ_HOST: {{ pillar['nova']['RABBITMQ_HOST'] }}
      RABBITMQ_PORT: {{ pillar['nova']['RABBITMQ_PORT'] }}
      RABBITMQ_USER: {{ pillar['nova']['RABBITMQ_USER'] }}
      RABBITMQ_PASS: {{ pillar['nova']['RABBITMQ_PASS'] }}
      NOVNC_PROXY_URL: {{ pillar['nova']['NOVNC_PROXY_URL'] }}
      GLANCE_HOST: {{ pillar['nova']['GLANCE_HOST'] }}
      VNC_SERVER: {{ grains['fqdn'] }}
      VNC_SERVER_PROXY: {{ grains['fqdn'] }}
      AUTH_KEYSTONE_URI: {{ pillar['nova']['AUTH_KEYSTONE_URI'] }}
      AUTH_KEYSTONE_HOST: {{ pillar['nova']['AUTH_KEYSTONE_HOST'] }}
      AUTH_KEYSTONE_PORT: {{ pillar['nova']['AUTH_KEYSTONE_PORT'] }}
      AUTH_KEYSTONE_PROTOCOL: {{ pillar['nova']['AUTH_KEYSTONE_PROTOCOL'] }}
      AUTH_ADMIN_PASS: {{ pillar['nova']['AUTH_ADMIN_PASS'] }}
      CONTROL_IP: {{ pillar['nova']['CONTROL_IP'] }}
