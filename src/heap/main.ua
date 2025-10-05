NewHeap ← [0]

# ? val heap
InsertHeap ← (
  ˜⊂   # append at last
  -₁⊸⧻ # compute current last index
  ⍢⊃(⌊÷₂)(
    [⟜(⌊÷₂)] # compute the parent index
    ⍜⊏⍆      # sort both of them
  )(>1
  ) # do till index > 1
  ◌
)

# ? indexes heap
SwapIfLessThan ← ⍜⊏(⍆˙⍤<⊸°⊟)

CheckHeapEmpty ← ˙⍤>1⧻
# heap value ? heap
PopHeap ← (
  CheckHeapEmpty .

  ⍜↘₁°˜⊂ # remove the top element
  ⍢⍣(
    # check if left node is greater
    ⊃[×₂|∘]
    ⊃⊢SwapIfLessThan
  | # check if right node is greater
    ⊃[+₁×₂|∘]
    ⊃⊢SwapIfLessThan
  | # or just return zero 
    0⋅∘
  )± 1 # check for the zero
  ◌    # remove the zero
  :    # value on top
)

NewHeap
InsertHeap 50
InsertHeap 55
InsertHeap 53
InsertHeap 52
InsertHeap 54
# Heapify [0 20 30 40 50 60 70]
# HeapifyNthNode 1
# PopHeap
# ⋅PopHeap
# ⋅PopHeap
# ◌
