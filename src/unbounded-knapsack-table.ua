# Given a knapsack weight W and a set of n
# items with certain value vali and weight wti,
# we need to calculate minimum amount that could
# make up this quantity exactly. This is different
# from classical Knapsack problem, here we are allowed
# to use unlimited number of instances of an item.

# Get the indices on which this state depends
# and the value to be added on success
# Indexes Value ? Index WeightValues
GetDependencies ← |2.2 (
  ⤚(⊡-1⊢)   # Get current weight values
  ⊃(⋅∘|∘|⊣) # Save value for later return
  # The three indexes that we need
  ⊃[
  | ∘            # j, target
  | -[1 0]       # j-1, target
  | [⊃(⊢|˜-⊓⊣⊢)] # j, target-weight
  ]
  ≡⍜⊢◿₂ # This is optimization of 01 knapsack in which
  # only two rows are being used
  ▽⊸≡(⊣≥0) # Keep the valid indices
)

# Apply the dp function on the table
# Table ? Indexes Value Table
ApplyDpFunction ← |3 (
  ⊙⊃⋅∘∘ # Put the value on bottom
  ⍜⊡ ⍣⊃[
  | ↥⊃(⊡1|+⊡2) # maximum of both cases
  | ⊡1
  | ⊡2 # keeping rest same
  ]⊃[
    # Not taking weight case
  | ⊡1
  | ⊡1
  ]
)

# ? n m
GetAllIndices! ← (
  ↯ ∞_2 ⊞⊂∩(⇡+₁) # this should be obvious
  ▽⊸≡(^)         # Filter by condition provided
)

# Maxvalue ? WeightValues Capacity
Knapsack ← (
  ⊃(
  | GetAllIndices!(>₀⊢)⧻ # Get Indices
  | ∘                    # The Items
  | ˜↯0 [2 +1◌]          # Initialize matrix to zero
  | ◿₂⧻                  # save the length for future use
  )

  ⍢⊃(
    ↘1⊙∘
  | ⊢
    GetDependencies
    ApplyDpFunction
  ) (±⧻
  ) # Do while some index is present

  # Get the last element of the matrix
  ⋅⋅∘
  ⊣˜⊡
)

Weights  ← [1 50]
Values   ← [1 30]
WV       ← ≡⊟ Weights Values
Capacity ← 100

WV Capacity
Knapsack
