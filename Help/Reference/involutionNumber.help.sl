# involutionNumber

- _involutionNumber(n)_

Answer the _n_-th involution number.

OEIS [A000085](https://oeis.org/A000085):

```
>>> 0:23.collect(involutionNumber:/1)
[
	1
	1
	2
	4
	10
	26
	76
	232
	764
	2620
	9496
	35696
	140152
	568504
	2390480
	10349536
	46206736
	211799312
	997313824
	4809701440
	23758664096
	119952692896
	618884638912
	3257843882624
]
```

There is a recurrence relation:

```
>>> { :a :n |
>>> 	a[n - 1] + ((n - 2) * a[n - 2])
>>> }.recurrenceTable([1 1], 12)
[1 1 2 4 10 26 76 232 764 2620 9496 35696]
```

* * *

See also: binomial, doubleFactorial

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A000085),
_W_
[1](https://en.wikipedia.org/wiki/Telephone_number_(mathematics))
