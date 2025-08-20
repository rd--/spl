# padovanSequence

- _padovanSequence(n, [x₁ x₂ …])_

Answer the first _n_ elements of the Padovan sequence,
given initial terms _x_,
set to _1,1,1_ if elided.
This is the same recurrence relation as for the `perrinSequence`,
but with different initial conditions.

First few places:

```
>>> 26.padovanSequence
[
	  1   1   1   2   2
	  3   4   5   7   9
	 12  16  21  28  37
	 49  65  86 114 151
	200 265 351 465 616
	816
]

>>> 22.padovanSequence
22.padovanSequence([1 1 1])
```

The limit ratio between consecutive terms is the plastic ratio:

```
>>> 816 / 616
1.plasticRatio
```

Begin sequence with _1 0 0_,
OEIS [A000931](https://oeis.org/A000931):

```
>>> 30.padovanSequence([1 0 0])
[
	  1   0   0   1   0
	  1   1   1   2   2
	  3   4   5   7   9
	 12  16  21  28  37
	 49  65  86 114 151
	200 265 351 465 616
]

>>> 616/465
1.plasticRatio
```

The Perrin sequence,
as given by `perrinFunction`,
is the same recurrence relation but with the initial sequence _3 0 2_,
OEIS [A001608](https://oeis.org/A001608):

```
>>> 27.padovanSequence([3 0 2])
[
	   3    0    2    3    2
	   5    5    7   10   12
	  17   22   29   39   51
	  68   90  119  158  209
	 277  367  486  644  853
	1130 1497
]

>>> 1497/1130
1.plasticRatio
```

The Van der Laan sequence,
OEIS [A182097](https://oeis.org/A182097):

```
>>> 27.padovanSequence([1 0 1])
[
	  1   0   1   1   1   2   2   3   4   5
	  7   9  12  16  21  28  37  49  65  86
	114 151 200 265 351 465 616
]

>>> 616/465
1.plasticRatio
```

Padovan L-system, the size of the sequence at each step gives the Padovan sequence:

```
>>> let r = [1 -> [2], 2 -> [3], 3 -> [1 2]];
>>> let x = r.substitutionSystem([1], 8);
>>> (x.collect(size:/1), x)
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

Guides: Integer Sequences, Mathematical Sequences

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

Further Reading: Padovan 1994

Categories: Math, Sequence
