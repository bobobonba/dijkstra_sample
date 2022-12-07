require_relative './dijkstra.rb'

node_num = 7

nodes = Array.new(node_num).map.with_index do |_, index|
  Dijkstra::Node.new(tag: "node#{index}")
end


rink_nodes = []
rink_nodes << [nodes[1], nodes[2]]
rink_nodes << [nodes[0], nodes[2], nodes[3], nodes[4]]
rink_nodes << [nodes[0], nodes[1], nodes[4]]
rink_nodes << [nodes[1], nodes[5]]
rink_nodes << [nodes[1], nodes[2], nodes[5], nodes[6]]
rink_nodes << [nodes[3], nodes[4], nodes[6]]
rink_nodes << [nodes[4], nodes[5]]

rink_costs = []
rink_costs << [10, 9]
rink_costs << [10, 7, 8, 6]
rink_costs << [9, 7, 5]
rink_costs << [8, 11]
rink_costs << [6, 5, 7, 6]
rink_costs << [11, 7, 10]
rink_costs << [6, 10]

rink_nodes.each.with_index do |node_array, nodes_index|
  node_array.each.with_index do |node, node_index|
    nodes[nodes_index].connect_to(node, rink_costs[nodes_index][node_index])
  end
end

walker = Dijkstra::Walker.new
walker.move(nodes[0], nodes[3])
route = walker.show_route

route.each do |node|
  puts node.tag
end
