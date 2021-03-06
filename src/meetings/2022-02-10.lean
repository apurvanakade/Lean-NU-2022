-- Next time: let's see how the graph theory theorem about the sum of degrees being even is coded in lean.

import combinatorics.simple_graph.connectivity

open_locale classical

universe u
variables {V : Type u} (G : simple_graph V)

#print simple_graph.walk -- prints the definition
#check nonempty -- prints the type of the object

-- simple_graph.walk u v  is the type of all walks from u to v

-- prove that if u is adjacent to v then the set of walks from u to v is non-empty

def simple_graph.walks_of_len (G : simple_graph V) (u v : V) (n : ℕ) := 
  { x : G.walk u v // x.length = n }

theorem adjacent_to_walk {u v : V} (h : G.adj u v) : nonempty (G.walks_of_len u v 1) :=
begin
  apply nonempty.intro,
  split, 
  swap,
  { have p := @simple_graph.walk.nil _ _ v,
    exact simple_graph.walk.cons h p },
  simp only [simple_graph.walk.length_nil, simple_graph.walk.length_cons],
end

-- lemma len_of_cons_ge_one {}

theorem eq_of_len_zero {u v : V} (w : G.walks_of_len u v 0) : u = v :=
begin 
  cases w with w h,
  induction w,
  { refl },
  { exfalso,
    simp only [nat.succ_ne_zero, simple_graph.walk.length_cons] at *,
    exact h, }
end 

theorem exists_walk_of_len {u v : V} (n : ℕ) (w : G.walk u v) (h : w.length = n + 1) : 
  ∃ (v' : V) (w' : G.walk u v'), (w'.length = n) ∧ (G.adj v' v) := 
begin 
  sorry,
end 


theorem non_eq_of_len_one {u v : V} (w : G.walk u v) (h : w.length = 1) : G.adj u v := 
begin 
  
end


theorem non_eq_of_len_one {u v : V} (w : G.walks_of_len u v 1) : u ≠ v := 
begin 
  cases w with w h,
  sorry,
  -- induction w,
  -- {intro h,
  -- contradiction,},
  -- simp,
  -- contradiction,

end


theorem adj_of_len_one {u v : V} (w : G.walks_of_len u v 1) : G.adj u v := 
begin 
  cases w with w h,
  sorry,
end