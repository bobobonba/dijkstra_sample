require_relative './dijkstra.rb'

node_num = 7

nodes = Array.new(node_num).map.with_index do |_, index|
  Dijkstra::Node.new(tag: "node#{index}")
end

#無向グラフの例
#=begin
rink_nodes = []
rink_nodes << [nodes[1], nodes[2]]
rink_nodes << [nodes[0], nodes[2], nodes[3], nodes[4]]
rink_nodes << [nodes[0], nodes[1], nodes[5]]
rink_nodes << [nodes[1], nodes[4]]
rink_nodes << [nodes[1], nodes[3], nodes[5], nodes[6]]
rink_nodes << [nodes[2], nodes[4], nodes[6]]
rink_nodes << [nodes[4], nodes[5]]

rink_costs = []
rink_costs << [4, 3]
rink_costs << [4, 1, 1, 5]
rink_costs << [3, 1, 2]
rink_costs << [1, 3]
rink_costs << [5, 3, 1, 2]
rink_costs << [2, 1, 4]
rink_costs << [2, 4]
#=end

#有向グラフの例
=begin
rink_nodes = []
rink_nodes << [nodes[1], nodes[2]]
rink_nodes << [nodes[2], nodes[3], nodes[4]]
rink_nodes << [nodes[5]]
rink_nodes << [nodes[4]]
rink_nodes << [nodes[6]]
rink_nodes << [nodes[4], nodes[6]]
rink_nodes << []

rink_costs = []
rink_costs << [4, 3]
rink_costs << [1, 1, 5]
rink_costs << [2]
rink_costs << [3]
rink_costs << [2]
rink_costs << [1, 4]
rink_costs << []
=end

rink_nodes.each.with_index do |node_array, nodes_index|
  node_array.each.with_index do |node, node_index|
    nodes[nodes_index].connect_to(node, rink_costs[nodes_index][node_index])
  end
end

walker = Dijkstra::Walker.new
walker.move(nodes[0], nodes[6])
route = walker.show_route

route.each do |node|
  puts node.tag
end
