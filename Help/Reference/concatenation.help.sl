# concatenation

- _concatenation(aCollection, isStrict=false)_

Flattens the collection by one level into a `List`.
If _isStrict_ is `true`,
each of the items in _aCollection_ must be of the same type as the container.

```
>>> [1 2 3; 4 5; 6].concatenation
[1 2 3 4 5 6]
```

Is `identity` at the empty `List`:

```
>>> [].concatenation
[]
```

Concatenate two matrices vertically, ie. columnwise:

```
>>> [
>>> 	1 2; 3 4:;
>>> 	5 6; 7 8; 9 0
>>> ].concatenation
[
	1 2;
	3 4;
	5 6;
	7 8;
	9 0
]
```

At a `List` of `Record` answers the `concatenation` of the values,
see `dictionaryJoin` for a _merge_ function:

```
>>> [(x: 1), (y: 2), (z: 3)].concatenation
[1 2 3]
```

At `List` of `String`:

```
>>> ['abc' 'pqr' 'xyz'].concatenation
['a' 'b' 'c' 'p' 'q' 'r' 'x' 'y' 'z']

>>> {
>>> 	['x' 'y' 'z'].concatenation(true)
>>> }.ifError { true }
true
```

Where supported `concatenation` is displayed as ⧻.

* * *

See also: ++, +++, dictionaryJoin, flatten, gather

Unicode: U+29FB ⧻ Triple Plus

Categories: Converting
