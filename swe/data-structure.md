# Heaps
A heap is a data structure based on a binary tree. It effciently implements an ADT called a priority queue. A priority queue resembles a queue, with one difference: each element has a “priority” associated with it, and deletion removes the element with the highest priority.
Key benefit: O(1) lookup find-max, O(log n) insertion, and O(log n) deletion of max. Node and array representations. Min-heap variant.

# Binary search trees (BST)

Insertion and deletion can be implemented so that the height of the BST is O(log n), leading to fast O(log n) lookup and update times. AVL trees and red-black trees are BST implementations that support this form of insertion and deletion

Key benefit: O(log n) insertions, deletions, lookups, find-min, find-max, successor, predecessor when tree is balanced. Understand node fields, pointer implementation. Be familiar with notion of balance, and operations maintaining balance. Know how to augment a binary search tree, e.g., interval trees and dynamic k-th largest.

# Hash table
Quando il numero di chiavi non è noto a priori, la loro continua aggiunta ad un hash table può comportare un ridimensionamento che può avere complessità O(n)

# skip lists

# treaps

# Fibonacci heaps

# tries

# disjoint-set

# Contare il numero di bit uguali a 1 in una variabile `x`
- usare una variabile `m=1`, fare AND con `x`, shiftare `m` e ripetere per tutti i bit; complessità lineare nel numero di bit di `x`
- calcolare `y=x&~(x-1)`; `y` avrà un 1 nella stessa posizione in cui x ha il bit più piccolo
  - finchè y<>0, si può aggiungere uno
  - azzerare il bit di `x` individuato inizialmente e ripetere
- usare una mappa di lookup con le word di `x`
