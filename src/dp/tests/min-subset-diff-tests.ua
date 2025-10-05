~ "../knapsack/min-subset-diff.ua" ~ MinSubsetDifference

# empty list
⍤⤙≍ 0 MinSubsetDifference []
# single element
⍤⤙≍ 10 MinSubsetDifference [10]
# two equal elements
⍤⤙≍ 0 MinSubsetDifference [5 5]
# two unequal elements
⍤⤙≍ 4 MinSubsetDifference [3 7] # (7 vs 3)
# multiple elements, can partition equally
⍤⤙≍ 0 MinSubsetDifference [1 5 11 5] # (11 vs 1+5+5)
# multiple elements, minimum diff = 1
⍤⤙≍ 1 MinSubsetDifference [1 2 3 5] # (1+5 vs 2+3) = 6 vs 5
# all elements same, even count
⍤⤙≍ 0 MinSubsetDifference [4 4 4 4]
# all elements same, odd count
⍤⤙≍ 4 MinSubsetDifference [4 4 4] # (4+4 vs 4) = 8 vs 4
# larger set, can partition equally
⍤⤙≍ 0 MinSubsetDifference [3 1 1 2 2 1]
# larger set, minimum diff > 0
⍤⤙≍ 0 MinSubsetDifference [3 1 1 2 2 5] # (3+2+2+1 vs 5+1) = 8 vs 6, or (5+3 vs 2+2+1+1) = 8 vs 6
# all ones
⍤⤙≍ 1 MinSubsetDifference [1 1 1 1 1] # (1+1+1 vs 1+1) = 3 vs 2
# large difference unavoidable
⍤⤙≍ 96 MinSubsetDifference [1 1 1 1 100] # (100 vs 1+1+1+1)
# stress test, 15 elements, can partition equally
⍤⤙≍ 1 MinSubsetDifference [70 73 77 80 82 87 90 94 98 106 110 113 115 118 120]
# stress test, 15 elements, minimum diff = 1
⍤⤙≍ 0 MinSubsetDifference [70 73 77 80 82 87 90 94 98 106 110 113 115 118 121]
# small values with minimum diff
⍤⤙≍ 0 MinSubsetDifference [1 2 3 4 5 5] # (1+4+5 vs 2+3+5) = 10 vs 10
# ascending sequence
⍤⤙≍ 0 MinSubsetDifference [1 2 3 4 6] # (1+3+4 vs 2+6) = 8 vs 8
