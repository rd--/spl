# sort

- _sort(aSequence, aBlock:/2)_
- _sort(aSequence)_ ≡ _sort(aSequence, <=)_

Sort _aSequence_ in place using the comparator _aBlock_.
If the sort block is omitted or is nil, sort by `<=`.

```
>>> let a = [3 2 1];
>>> a.sort = a & { a = [1 2 3] }
true

>>> let a = [1 2 3];
>>> a.sort(>) = a & { a = [3 2 1] }
true

>>> ['d' 'b' 'c' 'a'].sort
['a' 'b' 'c' 'd']

>>> ['cat' 'fish' 'catfish' 'Cat'].sort
['Cat' 'cat' 'catfish' 'fish']
```

* * *

See also: sortBy, sorted, sortOn

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sort.html)

Categories: Sorting
