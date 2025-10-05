# Given two sequences, find the length of
# longest subsequence present in both of them.
# A subsequence is a sequence that appears in
# the same relative order, but not necessarily contiguous.

# If any of them is empty, then return zero
# ? a b
BaseCondition ← ⍤0 ×∩(±⧻)

# ? s t
LcsRec ← |2 ⍣(
  ⟜⤙BaseCondition
  ⊃( # all the branches
  | ⍣(
      ˙⍤≍⊃∩⊢∩↘₁ # assert that both matches
      +1LcsRec  # recursive call on rest of string
    )0          # if fails then return 0
  | LcsRec ↘₁⊙∘ # Drop from first
  | LcsRec ⊙↘₁  # Drop from second
  )
  ↥↥ # take max of all three cases
)(◌◌ # return the base condition result
)

# ? n m
GetAllIndices! ← (
  ↯∞_2 ⊞⊂ ∩(⇡+1)
  ▽⊸≡(^)
)

# ? [i j] s t
GetElements ← ⊓⌞(⊡⊢)(⊡⊣) -₁

# ? [i j] s t
GetDependencies ← (
  ⊃[
  | ∘
  | -[1 0]         # drop either from s
  | -[0 1]         # or drop from t
  | ⍣(⤚GetElements # get the characters
      ˙⍤≍          # check if they are same
      -[1 1]       # drop both the elements
      # if not same return invalid index
    )[¯1 ¯1]
  ]
  ▽⊸≡(/×≥₀) # Keep the valid indices
)

# ? indices table
ApplyDpFunction ← (
  ⍜⊡ ⍣⊃[
    # first branch in which both present
  | /↥⊃[⊡1|⊡2|+1⊡3]
  | ⊡1
  | ⊡2
  | ⊡3
    # second branch
  ]⊃[↥⊃⊡₁⊡₂|⊡1|⊡2]
)

# ? s t
LcsTable ← (
  ⊃( # all the indices
  | GetAllIndices!(/×>₀) ∩⧻
  | ¤⊙¤         # the two strings
  | ˜↯ 0 +₁[∩⧻] # the dp matrix full of zeroes
  )

  ∧(
    GetDependencies
    ApplyDpFunction
  )
)

# "abcbdab" "bdcaba"
# LcsTable
