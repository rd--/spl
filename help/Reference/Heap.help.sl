# Heap

A binary heap, a kind of binary tree stored in a linear list.

Heaps are useful for priority queues because:

1) greatest priority element according to the sort block will be stored in first position
2) worst case time for inserting or removing an element is O(log n) where n is the size of the Heap
3) there is no need to fully sort the Heap

Insertion and removal times are more efficient than above upper bound, provided that:

a) Elements are only removed at the beginning
b) Elements are added with arbitrary sort order

The heap can be fully sorted using _sort_.
Worse time for fully sorting the Heap is O(n log n).
Unless the Heap has been sorted iterators will not enumerate elements in order.

Heap implements the Iterable, Collection, Extensible and Removable traits.

* * *

Categories: Collection, Type
