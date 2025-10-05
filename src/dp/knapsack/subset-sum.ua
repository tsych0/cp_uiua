# Given a set of non-negative integers, and a value sum,
# determine if there is a subset of the given set with sum equal to given sum.

# Check if target is zero, then return true
BaseConditionTarget ← ⍤1 ≠0
# Then if list is empty then return false
BaseConditionList ← ⍤0 ±⧻

# SubsetExists ? List Target
SubsetSumRec ← |2 ⍣(
  ⊙⟜BaseConditionTarget
  ⟜BaseConditionList

  ⟜⤙⍣(
    ⊃(
    | ˙⍤ ≥⊢ # check if can be taken or not
    | ↘₁    # rest of the list
    | -⊢    # updated target
    )
    SubsetSumRec # recurse
  )0             # false if failed from this branch

  SubsetSumRec ↘₁

  ↥ # or of both the branches
)(◌◌)

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
SubsetSumTable ← (
  ⊃(
  | GetAllIndices!(>₀⊢)⧻
  | ¤∘
  | ⍜(⊡0_0|⋅1) ˜↯ 0 +1[⧻⊙∘]
  )

  ∧(
    GetDependencies
    ApplyDpFunction
  )
)

# [3 34 4 12 5 2] 9
# SubsetSumRec

# [2 4 6 10] 16
# SubsetSumTable
