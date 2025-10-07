# Created by Ayush Biswas at 2025/10/06 18:37
# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0008
# @code begin

CheckEof ← |1.0 ˙⍤¬≍0

# ?
Solve ← (
  &sc
  ⟜CheckEof
  ⋕
  ⧅⋅⋅1 4 ⇡10
  ≡/+
  =
  /+
  &p
)

⍢(⍣(1Solve)0 ◌)±1
# ⍥Solve⋕&sc

# @code end
