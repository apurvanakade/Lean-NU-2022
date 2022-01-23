import tactic
import data.real.basic

universe u

example (T : Type u) [add_comm_group T] (a b c: T) : a + b = c → b + a = c :=
begin 
  intro h, 
  rw add_comm,
  assumption
end

-- Next time:
-- definition of a graph (simple = no loops, no multiple edges)
-- definition of the adjacency matrix of a graph
-- definition of the degree of a vertex
-- examples: empty graphs, complete graphs (eg. K_3, K_n), bipartite graphs
-- theorem: sum of degrees of all the vertices is even.

-- Useful tips about Lean
-- tidy?
-- library_search
-- calc mode
-- squeeze_simp
-- Try codewars puzzles if you've time

lemma pow_x_3_monotone (f : ℝ → ℝ) (hf : f = λ x, x^3) : monotone f :=
begin
  unfold monotone,
  intros a b h,
  rw hf,
  simp only,
  sorry,
end

example (a b c: ℕ) : (b + c) * a = b * a + c * a:=
begin
  exact add_mul b c a,
end

example (a b : ℕ) : (a + b)^2 = a^2 + 2 * a * b + b^2 :=
begin 
  calc (a + b)^2 = (a + b) * (a + b) : sq _
  ... = a * (a + b) + b * (a + b) : add_mul _ _ _
  ... = a * a + a * b + b * a + b * b : by sorry 
  ... = a^2 + 2 * a * b + b^2 : sorry,
end