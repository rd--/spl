# bisect

- _bisect(aSequence, anObject)_

Locate the insertion point for _anObject_ in _aSequence_ to maintain sorted order.
This method is an alias for `binarySearchRightmost`.

Show equivalent use of `detectIndex` and `binarySearchRightmost`:

```
>>> [8 9].collect { :n |
>>> 	let x = [1, 3 .. 15];
>>> 	let i = x.bisect(n);
>>> 	let j = x.detectIndex { :each | n <= each };
>>> 	let k = x.binarySearchRightmost(n);
>>> 	(i, x[i], j, x[j], k, x[k])
>>> }
[
	(5, 9, 5, 9, 5, 9),
	(5, 9, 5, 9, 5, 9)
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

See also: <, <=, addBeforeIndex, binarySearchRightmost, detectIndex

References:
_Python_
[1](https://docs.python.org/3/library/bisect.html)
