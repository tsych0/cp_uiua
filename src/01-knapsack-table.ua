# Get the indices on which this state depends
# and the value to be added on success
# Indexes Value ? Index WeightValues
GetDependencies ← |2.2 (
  ⤚(⊡-1⊢) # Get current weight values
  ⊃(:|⊣)  # Save value for later return
  # The three indexes that we need
  [⊃(∘               # j, target
    | -[1 0]         # j-1, target
    | [⊃(-1⊢|˜-⊓⊣⊢)] # j-1, target-weight
    )]
  ≡⍜⊢◿₂ # This is optimization of 01 knapsack in which
  # only two rows are being used
  ▽⊸≡(⊣≥0) # Keep the valid indices
)

# Apply the dp function on the table
# Table ? Indexes Value Table
ApplyDpFunction ← |3 (
  ⊙: # Put the value on bottom
  ⍜⊡ ⍣[⊃(
      ↥⊃(⊡1|+⊡2) # maximum of both cases
    | ⊡1 | ⊡2    # keeping rest same
    )
  ][⊃(⊡1|⊡1)
  ] # Not taking weight case
)

# ? n m
GetAllIndices! ← (
  ↯ ∞_2 ⊞⊂∩(⇡+₁)
  ▽⊸≡(^) # Filter by condition
)

# Maxvalue ? WeightValues Capacity
Knapsack ← (
  ⊃(⋅∘|⊸⧻⟜⧻)
  ↯:0 [2 +1∘] . # Get the zero matrix
  ⊃(GetAllIndices!(>₀⊢) : ⋅⊙⊙∘|∘)

  ⍢⊃(
    ↘1⊙∘
  | ⊢
    GetDependencies
    ApplyDpFunction
  ) (±⧻
  ) # Do while some index is present

  # Get the last element of the matrix
  ⋅⋅∘
  ⊡⤚[:⊓(-1⧻⊢)◿₂]
)

Weights  ← [3 5 4 1]
Values   ← [4 7 5 1]
WV       ← ≡⊟ Weights Values
Capacity ← 7
WV Capacity
Knapsack
