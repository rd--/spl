# mergeInPlace

- _mergeInPlace(aSequenceCollection, select:/1, insert:/2)_

Answer a `List` that merges a collection of sorted sequences into a sorted sequence.
The algorithm rewrites the input collection and the input sequences in place.

Sequences are sorted in ascending order, answer ascending list:

```
>>> [1 3 9; 2 4 7; 5 8; 6]
>>> .mergeInPlace(min:/1, add:/2)
[1 .. 9]
```

Sequences are sorted in descending order, answer ascending list:

```
>>> [4 2 -31; 65 0; 99 83 1; 782]
>>> .mergeInPlace(max:/1, addFirst:/2)
[-31 0 1 2 4 65 83 99 782]
```

* * *

See also: mergeSort, patienceSort
