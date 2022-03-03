import combinatorics.simple_graph.connectivity
import combinatorics.simple_graph.adj_matrix

universe u
variables {V : Type u} [decidable_eq V]
variables (G : simple_graph V) [decidable_rel G.adj]
variables {α : Type u} [decidable_eq α] [ring α]

def simple_graph.walks_of_len (G : simple_graph V) (u v : V) (n : ℕ) := 
  { x : G.walk u v // x.length = n }

theorem walk_of_adj {u v : V} (h : G.adj u v) : nonempty (G.walks_of_len u v 1) :=
begin
  apply nonempty.intro,
  split, 
  swap,
  { have p := @simple_graph.walk.nil _ _ v,
    exact simple_graph.walk.cons h p },
  simp only [simple_graph.walk.length_nil, simple_graph.walk.length_cons],
end

theorem eq_of_len_zero {u v : V} (w : G.walks_of_len u v 0) : u = v :=
begin 
  cases w with w h,
  induction w,
  { refl },
  { exfalso,
    simp only [nat.succ_ne_zero, simple_graph.walk.length_cons] at *,
    exact h, }
end 

theorem non_eq_of_len_one {u v : V} (w : G.walks_of_len u v 1) : u ≠ v := 
begin 
  cases w with w h,
  sorry,
end

theorem exists_walk_of_len {u v : V} (n : ℕ) (w : G.walks_of_len u v (n + 1)) : 
  ∃ (v' : V) (w' : G.walks_of_len u v' n), (G.adj v' v) := 
begin 
  cases w with w h,
  induction w,
  sorry,
  sorry,
end 

theorem adj_of_len_one {u v : V} (w : G.walks_of_len u v 1) : G.adj u v := 
begin 
  cases w with w h,
  sorry,
end

/-- theorems about finiteness -/

theorem walk_finset [fintype V] (u v : V) : finset(simple_graph.walk G u v) :=
begin 
  sorry,
end


theorem walks_of_len_finset [fintype V] (n : ℕ) (u v : V) : finset(simple_graph.walks_of_len G u v n) :=
begin 
  sorry,
end