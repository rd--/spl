# concatenation

- _concatenation(aCollection)_

Flattens the collection by one level into a `List`.

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

Where supported `concatenation` is displayed as ⧻.

* * *

See also: ++, dictionaryJoin

Unicode: U+29FB ⧻ Triple Plus

Categories: Converting
