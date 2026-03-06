# unaryExpansion

- _unaryExpansion(n)_

Answer the unary expansion of _n_.

First few terms,
OEIS [A000042](https://oeis.org/A000042):

```
>>> 1:9.collect(unaryExpansion:/1)
[
	1;
	1 1;
	1 1 1;
	1 1 1 1;
	1 1 1 1 1;
	1 1 1 1 1 1;
	1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1;
	1 1 1 1 1 1 1 1 1
]
```

Unary contraction:

```
>>> 1:9.collect(unaryExpansion:/1)
>>> .collect { :d | d.fromDigits(1) }
[1 2 3 4 5 6 7 8 9]
```

* * *

See also: fromDigits, integerDigits

Guides: Integer Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Unary_numeral_system)

