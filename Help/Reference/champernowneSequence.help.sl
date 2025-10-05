# champernowneSequence

- _champernowneSequence(b, n)_

Answer the first _n_ terms of the base-_b_ Champernowne sequence.

First few terms of the base-10 Champernowne sequence:

```
>>> 10.champernowneSequence(106)
[
	0 1 2 3 4 5 6 7 8 9
	1 0 1 1 1 2 1 3 1 4
	1 5 1 6 1 7 1 8 1 9
	2 0 2 1 2 2 2 3 2 4
	2 5 2 6 2 7 2 8 2 9
	3 0 3 1 3 2 3 3 3 4
	3 5 3 6 3 7 3 8 3 9
	4 0 4 1 4 2 4 3 4 4
	4 5 4 6 4 7 4 8 4 9
	5 0 5 1 5 2 5 3 5 4
	5 5 5 6 5 7
]
```

First few terms of the base-2 Champernowne sequence:

```
>>> 2.champernowneSequence(105)
[
	0 1 1 0 1 1 1 0 0 1
	0 1 1 1 0 1 1 1 1 0
	0 0 1 0 0 1 1 0 1 0
	1 0 1 1 1 1 0 0 1 1
	0 1 1 1 1 0 1 1 1 1
	1 0 0 0 0 1 0 0 0 1
	1 0 0 1 0 1 0 0 1 1
	1 0 1 0 0 1 0 1 0 1
	1 0 1 1 0 1 0 1 1 1
	1 1 0 0 0 1 1 0 0 1
	1 1 0 1 0
]
```

First few terms of the base-3 Champernowne sequence:

```
>>> 3.champernowneSequence(101)
[
	0 1 2 1 0 1 1 1 2 2
	0 2 1 2 2 1 0 0 1 0
	1 1 0 2 1 1 0 1 1 1
	1 1 2 1 2 0 1 2 1 1
	2 2 2 0 0 2 0 1 2 0
	2 2 1 0 2 1 1 2 1 2
	2 2 0 2 2 1 2 2 2 1
	0 0 0 1 0 0 1 1 0 0
	2 1 0 1 0 1 0 1 1 1
	0 1 2 1 0 2 0 1 0 2
	1
]
```

First few terms of the base-8 Champernowne sequence:

```
>>> 8.champernowneSequence(99)
[
	0 1 2 3 4 5 6 7 1 0
	1 1 1 2 1 3 1 4 1 5
	1 6 1 7 2 0 2 1 2 2
	2 3 2 4 2 5 2 6 2 7
	3 0 3 1 3 2 3 3 3 4
	3 5 3 6 3 7 4 0 4 1
	4 2 4 3 4 4 4 5 4 6
	4 7 5 0 5 1 5 2 5 3
	5 4 5 5 5 6 5 7 6 0
	6 1 6 2 6 3 6 4 6
]
```

* * *

See also: copelandErdosSequence, integerDigits

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChampernowneConstant.html)
[2](https://mathworld.wolfram.com/SmarandacheSequences.html)
[3](https://mathworld.wolfram.com/ConsecutiveNumberSequences.html)
[4](https://reference.wolfram.com/language/ref/ChampernowneNumber.html),
_OEIS_
[1](https://oeis.org/A007376)
[2](https://oeis.org/A030190)
[3](https://oeis.org/A054634)
[4](https://oeis.org/A054635),
_W_
[1](https://en.wikipedia.org/wiki/Champernowne_constant)
