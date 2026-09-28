# mergeSorted (mergeSortedInPlace)

- _mergeSorted([x₁ x₂ …], select/1, insert/2)_

Answer a `List` that merges a collection of sorted sequences into a sorted sequence.
The algorithm rewrites the input collection and the input sequences in place,
though they do not in the end contain the answer.

Sequences are sorted in ascending order, answer ascending list:

```
>>> let x = [1 3 9; 2 4 7; 5 8; 6];
>>> let y = x.mergeSorted!(min/1, add!/2);
>>> (x, y)
([], [1 .. 9])
```

Sequences are sorted in descending order, answer ascending list:

```
>>> let x = [4 2 -31; 65 0; 99 83 1; 782];
>>> let y = x.mergeSorted!(max/1, addFirst!/2);
>>> (x, y)
([], [-31 0 1 2 4 65 83 99 782])
```

* * *

See also: mergeSort, patienceSort

Guides: Sorting Functions
