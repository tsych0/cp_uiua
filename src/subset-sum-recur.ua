# Given a set of non-negative integers, and a value sum,
# determine if there is a subset of the given set with sum equal to given sum.

# Check if target is zero, then return true
BaseConditionTarget ← ⍤1 ≠0
# Then if list is empty then return false
BaseConditionList ← ⍤0 ±⧻

# SubsetExists ? List Target
SubsetSum ← |2 ⍣(
  ⊙⟜BaseConditionTarget
  ⟜BaseConditionList

  ⟜⤙⍣(
    ⊃(
    | ˙⍤ ≥⊢ # check if can be taken or not
    | ↘₁    # rest of the list
    | -⊢    # updated target
    )
    SubsetSum # recurse
  )0          # false if failed from this branch

  SubsetSum ↘₁

  ↥ # or of both the branches
)(◌◌)

[3 34 4 12 5 2] 9
SubsetSum
