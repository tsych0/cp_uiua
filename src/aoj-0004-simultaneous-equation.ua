# Created by Ayush Biswas at 2025/10/06 12:44
# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0004
# @code begin

CheckEof ← |1.0 ˙⍤¬≍0

# ?
Solve ← (
  &sc
  ⟜CheckEof
  ↯2_3 ⋕°/$"_ _"

  °⊟≡(≡⊏ ⧅<2⇡3 ¤)
  ≡/-×⊙(≡⇌)
  ⊃[
  | ÷⊃(⊢|¯⊣) # value of x
  | ÷⊃(⊢|⊡1) # value of y
  ]

  &p /$"_ _"
)

⍢(⍣(1Solve)0 ◌)±1
# ⍥Solve⋕&sc

# @code end
