
import combinatorics.simple_graph.connectivity

open_locale classical

universe u
variables {V : Type u} (G : simple_graph V)


theorem eq_of_len_zero {u v : V} (w : G.walk u v) (h : w.length = 0) : u = v :=
begin 
  -- { exfalso,
  --   simp only [nat.succ_ne_zero, simple_graph.walk.length_cons] at *,
  --   exact h, }
  --easy
  sorry,
end 


theorem exists_walk_of_len {u v : V} {n : ℕ} (w : G.walk u v) (h : w.length = n + 1) : 
  ∃ (v' : V) (w' : G.walk u v'), (w'.length = n) ∧ (G.adj v' v) := 
begin 
  -- not sure
  sorry,
end 

theorem adj_of_len_one {u v : V} (w : G.walk u v) (h : w.length = 1) : G.adj u v := 
begin 
  have h' := exists_walk_of_len G w h,
  rcases h' with ⟨v', w', h1, h2⟩,
  have h3 := eq_of_len_zero G w' h1,
  rw ← h3 at h2,
  assumption,
end

theorem non_eq_of_len_one {u v : V} (w : G.walk u v) (h : w.length = 1) : u ≠ v := 
begin 
  -- easy
  sorry
end