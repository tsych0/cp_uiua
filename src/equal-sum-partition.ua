# Partition problem is to determine whether a
# given set can be partitioned into two subsets
# such that the sum of elements in both subsets is same.

~ "subset-sum-table.ua" ~ SubsetSum

HalfSum ← (
  /+ # the sum
  ⊃(
    ⍤.=0◿₂ # assert even
  )÷₂      # get half
)

# ? List
EqualSumPartition ← ⍣(
  ⟜HalfSum
  SubsetSum
  ⊣⊣
)0

EqualSumPartition [1 2 3]
