module Dijkstra
  class Walker
    def initialize
      @current_node = nil
      @nodes_relation = {}
      @previous_node = nil
      @memo = {}
      @map = {}
      @start_node = nil
      @goal_node = nil
    end

    def move(start_node, goal_node)
      @start_node = start_node
      @goal_node = goal_node

      self.memorise(@start_node, @start_node, 0)
      self.drawing(@start_node, @memo[@start_node])
      self.analyse(@start_node, @map[@start_node])

      while @map[@goal_node].nil?
        min_node = self.closest_node(self.indeterminate_node(@map, @memo))
        self.drawing(min_node, @memo[min_node])
        self.analyse(min_node, @map[min_node])
      end
    end

    def show_route
      current_node = @goal_node
      route_array = []
      until current_node == @start_node
        next_node = @nodes_relation[current_node]
        route_array << current_node
        current_node = next_node
      end

      route_array << @start_node

      route_array.reverse
    end

    private
    def analyse(node, current_cost)
      node.links.each do |link|
        self.memorise(node, link.vnode, current_cost + link.cost)
      end
    end

    def memorise(unode, vnode, cost)
      if @memo[vnode].nil? || @memo[vnode] > cost
        @memo[vnode] = cost
        @nodes_relation[vnode] = unode
      end
    end
    
    def drawing(node, cost)
      if @map[node].nil?
        @map[node] = cost
      else
        false
      end
    end

    def indeterminate_node(determinate_nodes, nodes)
      nodes.filter { |node, _cost| determinate_nodes[node].nil? }
    end

    def closest_node(nodes_hash)
      nodes_hash.min { |(_node1, cost1), (_node2, cost2)| cost1 <=> cost2 }.first
    end
  end
end
