# fareyConvergence

- _fareyConvergence(x, n)_

Answer the Farey convergence for _x_ stopping when the denominator would be greater than _n_.

The Farey convergence to π:

```
>>> 1.pi.fareyConvergence(115)
[
	3/1
	13/4
	16/5
	19/6
	22/7
	179/57
	201/64
	223/71
	245/78
	267/85
	289/92
	311/99
	333/106
	355/113
]
```

The Farey convergence to √2:

```
>>> 2.sqrt.fareyConvergence(70)
[1/1 3/2 4/3 7/5 17/12 24/17 41/29 99/70]
```

Numerator of convergents to π by Farey fractions,
OEIS [A063674](https://oeis.org/A063674),
note accuracy of _355/113_:

```
>>> 1.pi.fareyConvergence(16750)
>>> .numerator
[
	3
	13
	16
	19
	22
	179
	201
	223
	245
	267
	289
	311
	333
	355
	52163
	52518
]
```

Denominators of convergents to π by Farey fractions,
OEIS [A063673](https://oeis.org/A063673),
note accuracy of _355/113_:

```
>>> 1.pi.fareyConvergence(16750)
>>> .denominator
[1
	4
	5
	6
	7
	57
	64
	71
	78
	85
	92
	99
	106
	113
	16604
	16717
]
```

* * *

See also: fareySequence, Fraction, fractionalPart

Guides: Number Functions
