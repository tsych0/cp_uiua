# Given two strings ‘X’ and ‘Y’,
# find the length of the longest common substring.

# If any of them is empty, then return zero
# ? a b
BaseCondition ← ⍤0 ×∩(±⧻)

# ? s t
LcSubStringRec ← |2 ⍣(
  ⟜⤙BaseCondition
  ⊃( # all the branches
  | ⍣(
      ˙⍤≍⊃∩⊢∩↘₁                # assert that both matches
      [+1⊢ ⊙0] LcSubStringRec  # recursive call on rest of string
    )0                         # if fails then return 0
  | [0 /↥] LcSubStringRec ↘₁⊙∘ # Drop from first
  | [0 /↥] LcSubStringRec ⊙↘₁  # Drop from second
  )
  ↥↥ # take max of all three cases
)(◌◌ # return the base condition result
)

# ↥↥
LcSubStr ← /↥ LcSubStringRec

⍤⤙≍ 0 LcSubStr "" ""
⍤⤙≍ 0 LcSubStr "abc" ""
⍤⤙≍ 3 LcSubStr "abc" "abc"
⍤⤙≍ 0 LcSubStr "abc" "def"
⍤⤙≍ 1 LcSubStr "abcde" "ace"
⍤⤙≍ 2 LcSubStr "abcbdab" "bdcaba"
⍤⤙≍ 2 LcSubStr "aaaa" "aa"
⍤⤙≍ 2 LcSubStr "aabbaa" "ababa"
⍤⤙≍ 3 LcSubStr "xyzabcuvw" "abc"
⍤⤙≍ 1 LcSubStr "AGGTAB" "GXTXAYB"
