# egyptianFraction

- _egyptianFraction(x, n)_

Answer the first _n_ terms of the Egyptian fraction representation of _x_.

Denominators of greedy Egyptian fraction for square root of two,
OEIS [A006487](https://oeis.org/A006487):

```
>>> 'Sqrt(2)'
>>> .namedConstant
>>> .egyptianFraction(7)
[
	1
	3
	13
	253
	218201
	61323543802
	5704059172637470075854L
]
```

Denominators of greedy Egyptian fraction for _e-2_,
OEIS [A006525](https://oeis.org/A006525):

```
>>> ('E'.namedConstant - 2)
>>> .egyptianFraction(7)
[
	2
	5
	55
	9999
	3620211523
	25838201785967533906L
	3408847366605453091140558218322023440765L
]
```

Egyptian fraction representation for the cube root of three,
OEIS [A132480](https://oeis.org/A132480):

```
>>> 'CubeRoot(3)'
>>> .namedConstant
>>> .egyptianFraction(7)
[1 3 10 113 14998 256725552 79495118506361081L]
```

* * *

See also: sylvesterExpansion

Guides: Number Functions
