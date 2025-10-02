# Given a value N, if we want to make change for N cents,
# and we have infinite supply of each of
# S = { S1, S2, .. , Sm} valued coins,
# how many ways can we make the change?
# The order of coins doesn’t matter.

# Check if target is zero, then 1 way {}
BaseConditionTarget ← ⍤1 ≠0
# Then if list is empty then 0 ways
BaseConditionList ← ⍤0 ±⧻

# SubsetExists ? List Target
CoinChangeWaysRec ← |2 ⍣(
  ⊙⟜BaseConditionTarget
  ⟜BaseConditionList

  ⟜⤙⍣(
    ⊃(
    | ˙⍤ ≥⊢ # check if can be taken or not
    | ∘     # rest of the list
    | -⊢    # updated target
    )
    CoinChangeWaysRec # recurse
  )0                  # zero ways if failed from this branch

  CoinChangeWaysRec ↘₁

  + # total number in both the branches
)(◌◌)

# ? n m
GetAllIndices! ← (
  ↯∞_2 ⊞⊂∩(⇡+1)
  ▽⊸≡(^)
)

# Indices ? Index List
GetDependencies ← (
  ⟜(⊡-1⊢) # Get the current value
  ⊃[
  | ∘        # j, target
  | -[1 0]   # j - 1, target
  | ⊃[⊢|˜-⊣] # j, target - v
  ]
  ▽⊸≡(≥₀⊣) # Filter valid indices
)

# ? Indices Table
ApplyDpFunction ← (
  ⍜⊡⍣⊃[
  | +⊃(⊡1|⊡2) # or of both cases
  | ⊡1
  | ⊡2
    # or just a single case
  ][.⊡1]
)

# MaxNumWays ? List Target
CoinChangeWaysTable ← (
  ⊃(
  | GetAllIndices!(>₀⊢)⧻
  | ∘
  | ⍜(⊡0_0|⋅1) ˜↯ 0 +1[⧻⊙∘]
  )

  ⍢⊃(
    ↘₁⊙∘ # restores the list and drops one index
  | ⊢
    GetDependencies
    ApplyDpFunction
  )(±⧻)

  ⋅⋅∘
)

[2 3 5] 9
# ⤚⊸ == ◡
# ⟜⤙ == ◠
⟜⤙CoinChangeWaysRec
CoinChangeWaysTable
