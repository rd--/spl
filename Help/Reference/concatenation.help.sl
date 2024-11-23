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
>>> [[1 2; 3 4], [5 6; 7 8; 9 0]].concatenation
[
	1 2;
	3 4;
	5 6;
	7 8;
	9 0
]
```

Where supported `concatenation` is displayed as ⧻.

* * *

See also: ++

Unicode: U+29FB ⧻ Triple Plus

Categories: Converting
