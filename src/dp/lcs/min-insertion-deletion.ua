# Given two strings ‘str1’ and ‘str2’ of size 
# m and n respectively. The task is to remove/delete
# and insert minimum number of characters from/in str1 
# so as to transform it into str2. It could be possible 
# that the same character needs to be removed/deleted 
# from one point of str1 and inserted to some another point.
~ "lcs.ua" ~ LcsTable

MinInsertionDeletion ← (
  -⊃(×2⊣⊣LcsTable)(+∩⧻)
)

MinInsertionDeletion "geeksforgeeks" "geeks"
