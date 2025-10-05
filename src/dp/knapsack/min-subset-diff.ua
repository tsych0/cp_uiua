~ "subset-sum.ua" ~ SubsetSumTable

# ? List
MinSubsetDifference ← (
  ⟜(./+)            # compute sum
  /↥ SubsetSumTable # then compute which sums are possible
  ▽⟜(⇡⧻)            # filter them
  /↧⌵-×2            # min(|sum - subsetsum|)
)

[10]
MinSubsetDifference
