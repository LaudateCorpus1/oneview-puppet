# Removes quotes from nil and false values
def attributes_parse(resource_attributes)
  attributes = resource['attributes']
  attributes.each do |key,value|
    attributes[key] = nil if value == 'nil'
    attributes[key] = false if value == 'false'
    attributes[key] = true if value == 'true'
  end
  return attributes
end

# Returns the result of a network search by name
def get_ethernet_network(name)
  matches = OneviewSDK::EthernetNetwork.find_by(@client, name: name)
  return matches
end
