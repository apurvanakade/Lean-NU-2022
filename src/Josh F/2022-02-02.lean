-- Next time: let's see how the graph theory theorem about the sum of degrees being even is coded in lean.

import combinatorics.simple_graph.connectivity

universe u
variables {V : Type u} (G : simple_graph V)

#print simple_graph.walk -- prints the definition
#check nonempty -- prints the type of the object
-- simple_graph.walk u v  is the type of all walks from u to v

-- prove that if u is adjacent to v then the set of walks from u to v is non-empty


theorem adjacent_to_walk {u v : V} (h : G.adj u v) : nonempty (G.walk u v) := 
begin 
  have p : (G.walk v v):= @simple_graph.walk.nil _ _ v,
  have g_walk : (G.walk u v) := @simple_graph.walk.cons _ _ u v v h p,
  have b : (nonempty (G.walk u v)) := @nonempty.intro _ g_walk,
  exact b,
  


end

theorem temp {u v : V} (w : G.walk u v) (h : w.length = 1) : G.adj u v := 
begin
  have x : (G.walk u u) := @simple_graph.walk.nil _ _ u,
  
end