~ "subset-sum-table.ua" ~ SubsetSum

# ? List
MinSubsetDifference ← (
  ⟜(./+)       # compute sum
  /↥ SubsetSum # then compute which sums are possible
  ▽⟜(⇡⧻)       # filter them
  /↧⌵-×2       # min(|sum - subsetsum|)
)

[10]
MinSubsetDifference
