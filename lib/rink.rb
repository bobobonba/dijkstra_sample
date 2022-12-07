module Dijkstra
  class Link
    attr_reader :unode, :vnode, :cost

    def initialize(unode, vnode, cost)
      @unode = unode
      @vnode = vnode
      @cost = cost
    end
  end
end
