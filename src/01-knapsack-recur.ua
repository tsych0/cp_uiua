# Given weights and values of n items,
# put these items in a knapsack of capacity W
# to get the maximum total value in the knapsack.
# In other words, given two integer arrays val[0..n-1]
# and wt[0..n-1] which represent values and weights associated
# with n items respectively. Also given an integer W which represents
# knapsack capacity, find out the maximum value subset of val[]
# such that sum of the weights of this subset is smaller than or
# equal to W. You cannot break an item, either pick the complete
# item, or don’t pick it (0-1 property).

BaseCondition ← ⍤0±⧻

# MaxValue ? WeightsValues  Capacity
KnapsackRec ← |2 ⍣(
  ⟜BaseCondition # Check if base condition has reached

  ⟜⤙⍣(
    # First branch
    ⊃(⊢|⋅∘|↘₁)    # take the first row
    ⊃(≥⊢|⊣|-⊢)    # compare, take difference and get value
    ˙⍤            # assert
    ⊙˜KnapsackRec # Recursive call on remaining capacity
    +             # add the value with recursion result
  )0

  KnapsackRec ↘1 # the second branch

  ↥ # take max of both the branches
)(◌◌
) # Return value of base condition

Weights  ← [3 5 4 1]
Values   ← [4 7 5 1]
WV       ← ≡⊟ Weights Values
Capacity ← 7

WV Capacity
KnapsackRec
