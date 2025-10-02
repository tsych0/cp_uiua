# Given a set of non-negative integers, and a value sum,
# determine if there is a subset of the given set with sum equal to given sum.

# ? n m
GetAllIndices! ← (
  ↯∞_2 ⊞⊂∩(⇡+1)
  ▽⊸≡(^)
)

# Indices ? Index List
GetDependencies ← (
  ⟜(⊡-1⊢) # Get the current value
  ⊃[
  | ∘          # j, target
  | -[1 0]     # j - 1, target
  | ⊃[-1⊢|˜-⊣] # j - 1, target - v
  ]
  ▽⊸≡(≥₀⊣) # Filter valid indices
)

# ? Indices Table
ApplyDpFunction ← (
  ⍜⊡⍣⊃[
  | ↥⊃(⊡1|⊡2) # or of both cases
  | ⊡1
  | ⊡2
    # or just a single case
  ][.⊡1]
)

# SubsetBooleanTable ? List Target
SubsetSum ← (
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

[2 4 6 10] 16
SubsetSum
(⊣⊣)
# ⊡7
