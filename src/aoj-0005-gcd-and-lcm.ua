# Created by Ayush Biswas at 2025/10/06 14:12
# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0005
# @code begin

CheckEof ← |1.0 ˙⍤¬≍0

Gcd ← ⋅∘ ⍢(⊃◿∘)±
Lcm ← ÷⊃Gcd×

# ?
Solve ← (
  &sc
  ⟜CheckEof
  °$"_ _"
  ∩⋕
  ⊃Gcd Lcm
  &p $"_ _"
)

⍢(⍣(1Solve)0 ◌)±1
# ⍥Solve⋕&sc

# @code end
