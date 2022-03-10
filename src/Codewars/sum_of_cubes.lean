--- https://www.codewars.com/kata/5d64d9c0a5aad20001b2d9f8/train/lean

import data.nat.basic
import tactic

def fsum : (ℕ → ℕ) → ℕ → ℕ :=
  λ f n, nat.rec_on n (f 0) (λ n' ihn', f (nat.succ n') + ihn')

def sq_nat : ℕ → ℕ := λ n, n ^ 2
def cb : ℕ → ℕ := λ n, n ^ 3

theorem nicomachus : ∀ n, sq_nat (fsum id n) = fsum cb n := sorry

-- https://leanprover-community.github.io/extras/calc.html
lemma example_calc_mode (a b c : ℕ) : (a + b) * c = c * b + c * a :=
begin 
  --ring,
  calc (a + b) * c 
      = a * c + b * c : by exact add_mul a b c
  ... = c * a + c * b : by simp [mul_comm]
  ... = c * b + c * a : by simp [add_comm],
end