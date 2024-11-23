# sort

- _sort(aSequence, aBlock:/2)_
- _sort(α)_ ⟹ _sort(α, <=)_

Sort _aSequence_ in place using the comparator _aBlock_.
If the sort block is omitted or is nil, sort by `<=`.
Answers _aSequence_.

At `List` of numbers:

```
>>> let a = [3 2 1];
>>> (a.sort == a, a)
(true, [1 2 3])

>>> let a = [1 2 3];
>>> (a.sort(>) == a, a)
(true, [3 2 1])
```

At `List` of `String`:

```
>>> ['d' 'b' 'c' 'a'].sort
['a' 'b' 'c' 'd']

>>> ['cat' 'fish' 'catfish' 'Cat'].sort
['cat' 'Cat' 'catfish' 'fish']
```

* * *

See also: isSorted, mergeSort, ordering, sortBy, sorted, sortOn, sortOnBy

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sort.html)

Categories: Sorting
