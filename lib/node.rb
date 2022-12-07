module Dijkstra
  class Node
    attr_reader :tag, :links

    def initialize(tag: nil)
      @tag = tag || self.object_id.to_s
      @links = []
    end

    def connect_to(node, cost)
      @links << Dijkstra::Link.new(self, node, cost)
    end

    def shortest_link
      @links.min{ |link1, link2| link1.cost <=> link2.cost }
    end

    def closest_node
      self.shortest_link.vnode
    end

    def link_leading_to(vnode)
      @links.find { |link| link.vnode == vnode }
    end

    def able_to_go
      @links.map { |link| link.vnode }
    end
  end
end
