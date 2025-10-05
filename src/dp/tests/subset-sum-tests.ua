SubsetSumTable ~ "../knapsack/subset-sum.ua"
# ~ "subset-sum-recur.ua" ~ SubsetSum

SubsetSum ← ⊣⊣ SubsetSumTable~SubsetSumTable

# no numbers
⍤⤙≍ 0 SubsetSum [] 10

# single number equals target
⍤⤙≍ 1 SubsetSum [10] 10

# single number too small
⍤⤙≍ 0 SubsetSum [5] 10

# two numbers add to target
⍤⤙≍ 1 SubsetSum [4 6] 10

# two numbers but cannot match target
⍤⤙≍ 0 SubsetSum [3 8] 10

# multiple numbers, subset exists
⍤⤙≍ 1 SubsetSum [2 4 6 10] 16

# multiple numbers, subset does not exist
⍤⤙≍ 0 SubsetSum [2 4 6 10] 15

# requires skipping larger numbers
⍤⤙≍ 1 SubsetSum [5 9 13 2] 11

# classic example
⍤⤙≍ 1 SubsetSum [3 34 4 12 5 2] 9

# classic example, not possible
⍤⤙≍ 0 SubsetSum [3 34 4 12 5 2] 30

# edge target 0 is always possible (empty subset)
⍤⤙≍ 1 SubsetSum [1 2 3] 0

# bigger set with exact match
⍤⤙≍ 1 SubsetSum [7 14 28 3 11 6] 25 # (14+11)

# bigger set, no match
⍤⤙≍ 0 SubsetSum [7 14 28 3 11 6] 26

# 15 numbers, target achievable
⍤⤙≍ 1 SubsetSum [70 73 77 80 82 87 90 94 98 106 110 113 115 118 120] 750

# 15 numbers, target not achievable
⍤⤙≍ 1 SubsetSum [70 73 77 80 82 87 90 94 98 106 110 113 115 118 120] 1000
