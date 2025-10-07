# Created by Ayush Biswas at 2025/10/06 18:44
# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0009
# @code begin

CheckEof ← |1.0 ˙⍤¬≍0

Sieve ← |1 ▽⊸(=1/+=0⊞◿.)↘₂⇡+1

# ?
Solve ← (
  &sc
  ⋕
  ⧻Sieve
  &p
)

⍢(⍣(1Solve)0 ◌)±1
# ⍥Solve⋕&sc

# @code end
