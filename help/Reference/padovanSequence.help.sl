# padovanSequence

- _padovanSequence(anInteger, initialSequence)_

```
>>> 22.padovanSequence
[1 1 1 2 2 3 4 5 7 9 12 16 21 28 37 49 65 86 114 151 200 265]
```

Begin sequence with _1 0 0_, c.f. OEIS A000931:

```
>>> 27.padovanSequence([1 0 0])
[
	1 0 0 1 0
	1 1 1 2 2 3 4 5 7 9 12 16 21 28 37 49 65 86 114 151 200 265
]
```

The Perrin sequence,
as given by `perrinFunction`,
is the same recurrence relation but with the initial sequence _3 0 2_,
c.f. OEIS A001608:

```
>>> 27.padovanSequence([3 0 2])
[3 0 2 3 2 5 5 7 10 12 17 22 29 39 51 68 90 119 158 209 277 367 486 644 853 1130 1497]
```

The Van der Laan sequence, c.f. OEIS A182097:

```
>>> 27.padovanSequence([1 0 1])
[1 0 1 1 1 2 2 3 4 5 7 9 12 16 21 28 37 49 65 86 114 151 200 265 351 465 616]
```


Padovan L-system, the size of the sequence at each step gives the Padovan sequence:

```
>>> let rules = [1 -> [2], 2 -> [3], 3 -> [1 2]].asMap;
>>> let steps = rules.substitutionSystem([1], 8);
>>> (steps.collect(size:/1), steps)
(
	[1 1 1 2 2 3 4 5 7],
	[
		1;
		2;
		3;
		1 2;
		2 3;
		3 1 2;
		1 2 2 3;
		2 3 3 1 2;
		3 1 2 1 2 2 3
	]
)
```

A matrix analogous to the Fibonacci Q-matrix exists for Padovan numbers:

```
>>> let q = [0 0 1; 1 0 1; 0 1 0];
>>> q.matrixPower(23)
[114 151 200; 200 265 351; 151 200 265]

>>> 23.padovanSequence.drop(23 - 5)
[114 151 200 265 351]
```

* * *

See also: perrinFunction, perrinSequence, plasticRatio

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PadovanSequence.html)
[2](https://mathworld.wolfram.com/PerrinSequence.html),
_OEIS_
[1](https://oeis.org/A000931)
[2](https://oeis.org/A001608)
[3](https://oeis.org/A182097),
_W_
[1](https://en.wikipedia.org/wiki/Padovan_sequence)
