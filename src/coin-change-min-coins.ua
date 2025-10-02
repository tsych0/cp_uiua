# Given a value V, if we want to make change for V cents,
# and we have infinite supply of each of
# C = { C1, C2, .. , Cm} valued coins,
# what is the minimum number of coins to make the change?

# Check if target is zero, then zero coins
BaseConditionTarget ← ⍤0 ≠0
# Then if list is empty then inifinite coins
BaseConditionList ← ⍤∞ ±⧻

# MinNumberOfCoins ? List Target
CoinChangeCoinsRec ← |2 ⍣(
  ⊙⟜BaseConditionTarget
  ⟜BaseConditionList

  ⟜⤙⍣(
    ⊃(
    | ˙⍤ ≥⊢ # check if can be taken or not
    | ∘     # rest of the list
    | -⊢    # updated target
    )
    CoinChangeCoinsRec # recurse
    +1
  )∞ # infinity if failed from this branch

  CoinChangeCoinsRec ↘₁

  ↧ # minimum coins of both the branches
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
  | -[1 0]   # j - 1, target # not taking this value
  | ⊃[⊢|˜-⊣] # j, target - v # taking this value
  ]
  ▽⊸≡(≥₀⊣) # Filter valid indices
)

# ? Indices Table
ApplyDpFunction ← (
  ⍜⊡⍣⊃[
  | ↧⊃(⊡1|+1⊡2) # minimum of both cases
  | ⊡1
  | ⊡2
    # or just a single case
  ][.⊡1]
)

# SubsetBooleanTable ? List Target
CoinChangeCoinsTable ← (
  ⊃(
  | GetAllIndices!(>₀⊢)⧻
  | ∘
  | ⍜(⊡0_0|⋅0) ˜↯ ∞ +1[⧻⊙∘]
  )

  ⍢⊃(
    ↘₁⊙∘ # restores the list and drops one index
  | ⊢
    GetDependencies
    ApplyDpFunction
  )(±⧻)

  ⋅⋅∘
)

CoinChangeCoinsRec [20 10 5] 30
CoinChangeCoinsTable [20 10 5] 30
