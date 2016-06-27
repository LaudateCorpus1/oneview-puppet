################################################################################
# (C) Copyright 2016 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

require 'spec_helper'

provider_class = Puppet::Type.type(:oneview_logical_interconnect).provider(:ruby)

describe provider_class do

  let(:resource) {
    Puppet::Type.type(:oneview_logical_interconnect).new(
      name: 'Test Logical Interconnect',
    ensure: 'present',
        data:
          {
              'name'                    => 'Encl2-my enclosure logical interconnect group',
              'portMonitor'             =>
              {
                'enablePortMonitor' => 'false'
              },
              'snmpConfiguration'   =>
              {
                'enabled' => 'false'
              }

          },
    )
  }

  let(:provider) { resource.provider }

  let(:instance) { provider.class.instances.first }

  it 'should be an instance of the provider Ruby' do
    expect(provider).to be_an_instance_of Puppet::Type.type(:oneview_logical_interconnect).provider(:ruby)
  end

  it 'should find the interconnect' do
    expect(provider.found).to be
  end

  it 'should get the snmp configuration from the logical interconnect' do
    expect(provider.get_snmp_configuration).to be
  end

  it 'should get the port monitor from the logical interconnect' do
    expect(provider.get_port_monitor).to be
  end

  it 'should get the qos configuration from the logical interconnect' do
    expect(provider.get_qos_aggregated_configuration).to be
  end

  it 'should get the logical interconnect compliant' do
    expect(provider.set_compliance).to be
  end

  it 'should update the snmp configuration' do
    expect(provider.set_snmp_configuration).to be
  end

  it 'should update the port monitor configuration' do
    expect(provider.set_port_monitor).to be
  end

end