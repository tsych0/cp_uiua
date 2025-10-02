# Given a knapsack weight W and a set of n
# items with certain value vali and weight wti,
# we need to calculate minimum amount that could
# make up this quantity exactly. This is different
# from classical Knapsack problem, here we are allowed
# to use unlimited number of instances of an item.

BaseCondition ← ⍤0±⧻

# MaxValue ? WeightsValues  Capacity
Knapsack ← |2 ⍣(
  ⟜BaseCondition # Check if base condition has reached

  ⟜⤙⍩⍣(
    # First branch
    ⊃(⊢|⋅∘|∘)   # take the first row
    ⊃(≥⊢|⊣|-⊢)  # compare, take difference and get value
    ˙⍤          # assert
    ⊙⍩˜Knapsack # Recursive call on remaining capacity
    +           # add the value with recursion result
  )0

  Knapsack ↘1 # the second branch

  ↥ # take max of both the branches
)(◌◌
) # Return value of base condition

Weights  ← [1 50]
Values   ← [1 30]
WV       ← ≡⊟ Weights Values
Capacity ← 100

# You are seeing 60 because of recursion depth limit
WV Capacity
Knapsack
