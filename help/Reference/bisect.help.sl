# bisect

- _bisect(aSequence, anObject, aBlock:/2)_

Answer the index of the first item in _aSequence_ for which the comparison predicate _aBlock_ answers `true`.
In the binary case use `<` as comparison.

Find insertion point for _n_ in _l_ using predicates `<` and `<=`,
showing equivalent use of `detectIndex`:

```
>>> [8 9].collect { :n |
>>> 	let l = [1, 3 .. 15];
>>> 	let i = l.bisect(n, <);
>>> 	let j = l.bisect(n, <=);
>>> 	let k = l.detectIndex { :each | n < each };
>>> 	(i, l[i], j, l[j], k, l[k])
>>> }
[
	(5, 9, 5, 9, 5, 9),
	(6, 11, 5, 9, 6, 11)
]
```

Insertion can be performed using `addBeforeIndex`:

```
>>> let l = [1, 3 .. 15];
>>> l.addBeforeIndex(8, 5);
>>> l
[1 3 5 7 8 9 11 13 15]
```

* * *

See also: <, <=, addBeforeIndex, detectIndex

References:
_Python_
[1](https://docs.python.org/3/library/bisect.html)
