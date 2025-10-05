~ "../lcs/lcs.ua" ~ LcsRec

Lcs ← LcsRec

⍤⤙≍ 0 Lcs "" ""
⍤⤙≍ 0 Lcs "abc" ""
⍤⤙≍ 3 Lcs "abc" "abc"
⍤⤙≍ 0 Lcs "abc" "def"
⍤⤙≍ 3 Lcs "abcde" "ace"
⍤⤙≍ 4 Lcs "abcbdab" "bdcaba"
⍤⤙≍ 2 Lcs "aaaa" "aa"
⍤⤙≍ 4 Lcs "aabbaa" "ababa"
⍤⤙≍ 3 Lcs "xyzabcuvw" "abc"
⍤⤙≍ 4 Lcs "AGGTAB" "GXTXAYB"
