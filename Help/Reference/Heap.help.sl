# Heap

A binary heap, a kind of binary tree stored in a linear list.

Heaps are useful for priority queues because:

1) greatest priority element according to the sort block will be stored in first position
2) worst case time for inserting or removing an element is O(log n) where n is the size of the Heap
3) there is no need to fully sort the Heap

Insertion and removal times are more efficient than above upper bound, provided that:

a) Elements are only removed at the beginning
b) Elements are added with arbitrary sort order

Heap implements the Iterable, Collection, Extensible and Removable traits.

Add all items in collection, which is out of order, and retrieve first (least) element:

```
>>> let h = Heap();
>>> h.addAll([5 7 1 3]);
>>> h.first
1
```

* * *

See also: add, addAll, heapSort, removeFirst

Categories: Collection, Type
