base:
  '*':
    - openstack.init.control_base
    - openstack.init.compute_base
    - openstack.rabbitmq.server
    - openstack.mysql.server
    - openstack.mysql.init
    - openstack.keystone.server
    - openstack.glance.server
    - openstack.nova.control
    - openstack.nova.compute
    - openstack.neutron.server
    - openstack.cinder.server
    - openstack.horizon.server
