~ "equal-sum-partition.ua" ~ EqualSumPartition

# empty list
⍤⤙≍ 1 EqualSumPartition []

# single element
⍤⤙≍ 0 EqualSumPartition [10]

# two equal elements
⍤⤙≍ 1 EqualSumPartition [5 5]

# two unequal elements
⍤⤙≍ 0 EqualSumPartition [3 7]

# multiple elements, possible
⍤⤙≍ 1 EqualSumPartition [1 5 11 5] # (11 vs 1+5+5)

# multiple elements, impossible
⍤⤙≍ 0 EqualSumPartition [1 2 3 5]

# all elements same, even count
⍤⤙≍ 1 EqualSumPartition [4 4 4 4]

# all elements same, odd count
⍤⤙≍ 0 EqualSumPartition [4 4 4]

# larger set, possible
⍤⤙≍ 1 EqualSumPartition [3 1 1 2 2 1]

# larger set, impossible
⍤⤙≍ 1 EqualSumPartition [3 1 1 2 2 5]

# stress test, 15 elements, possible
⍤⤙≍ 0 EqualSumPartition [70 73 77 80 82 87 90 94 98 106 110 113 115 118 120]

# stress test, 15 elements, impossible
⍤⤙≍ 1 EqualSumPartition [70 73 77 80 82 87 90 94 98 106 110 113 115 118 121]
