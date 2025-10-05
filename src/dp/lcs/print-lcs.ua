# Given two sequences,
# print the longest subsequence present in both of them.

~ "lcs.ua" ~ LcsTable

PrintLcs ← (
  LcsTable ⊙.
  ⊸⬚0⊃(↻[¯1 0]|↻[0 ¯1]) # shift bottom and right once
  ∩+₁                   # add one
  ×∩⌟=                  # compare with original
  ⊚                     # get all the indices where matched
  ⊸\↥                   # get rolling max
  ▽ ≡/× ⊸=              # check if equal to rolling max then keep if it is
  -1≡⊢                  # sub one for indexes
  ⇌⊏                    # get chars then reverse
)

PrintLcs "xyzabcuvw" "aybzcc"
