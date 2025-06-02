# catenate

- _catenate(aCollection, isStrict=false)_

Flattens the collection by one level into a `List`.
If _isStrict_ is `true`,
each of the items in _aCollection_ must be of the same type as the container.

```
>>> [1 2 3; 4 5; 6].catenate
[1 2 3 4 5 6]
```

Is `identity` at the empty `List`:

```
>>> [].catenate
[]
```

Catenate two matrices vertically, ie. columnwise:

```
>>> [
>>> 	1 2; 3 4:;
>>> 	5 6; 7 8; 9 0
>>> ].catenate
[
	1 2;
	3 4;
	5 6;
	7 8;
	9 0
]
```

Catenate effectively flattens the first two levels of a high-dimensional array:

```
>>> [2 2 2].iota.catenate
[1 2; 3 4; 5 6; 7 8]
```

At a `List` of `Record` answers the `catenate` of the values,
see `dictionaryJoin` for a _merge_ function:

```
>>> [(x: 1), (y: 2), (z: 3)].catenate
[1 2 3]
```

At `List` of `String`:

```
>>> ['abc' 'pqr' 'xyz'].catenate
['a' 'b' 'c' 'p' 'q' 'r' 'x' 'y' 'z']

>>> {
>>> 	['x' 'y' 'z'].catenate(true)
>>> }.ifError { true }
true
```

Where supported `catenate` is displayed as ⧻.

* * *

See also: ++, +++, collectCatenate, dictionaryJoin, flatten

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Catenate.html.en)

Unicode: U+29FB ⧻ Triple Plus

Categories: Converting
