# mapIndexed

- _mapIndexed(f/2, c)_

Answer a collection like _c_ where the values are given by _f_,
which receives both the _value_ and _index_,
in that order,
for each element.

At `Record`:

```
>>> { :x :i |
>>> 	i ++ x.printString
>>> }.mapIndexed(
>>> 	(x: 1, y: 2, z: 3)
>>> )
(x: 'x1', y: 'y2', z: 'z3')
```

Rotate lists based on position:

```
>>> rotateLeft/2.mapIndexed(
>>> 	List(6, [1 2 3])
>>> )
[
	2 3 1;
	3 1 2;
	1 2 3;
	2 3 1;
	3 1 2;
	1 2 3
]
```

* * *

See also: collect, keysAndValuesCollect, map, withIndexCollect

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MapIndexed.html)
