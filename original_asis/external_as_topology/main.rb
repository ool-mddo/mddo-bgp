# frozen_string_literal: true

require 'json'
require 'netomox'
require_relative 'bgp_as'
require_relative 'bgp_proc'
require_relative 'layer3'

def generate_topology
  nws = Netomox::DSL::Networks.new
  register_bgp_as(nws)
  register_bgp_proc(nws)
  register_layer3(nws)
  nws.topo_data
end

# If this script is executed directly
puts JSON.pretty_generate(generate_topology) if $0 == __FILE__
