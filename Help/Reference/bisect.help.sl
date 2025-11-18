# bisect

- _bisect([x₁ x₂ …], y)_

Locate the insertion point for the object _y_ in the sequence _x_ to maintain sorted order.
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
>>> let a = [1 3 5 7 9 11 13 15];
>>> let b = a.addBeforeIndex(8, 5);
>>> (a, b)
([1 3 5 7 8 9 11 13 15], 8)
```

* * *

See also: <, <=, addBeforeIndex, binarySearchRightmost, detectIndex

Guides: List Functions

References:
_Python_
[1](https://docs.python.org/3/library/bisect.html)
