# momentOfSymmetry

- _momentOfSymmetry(generator, period, maxDepth)_

Answer the sequence of moment of symmetry scales specified by a _generator_ and a _period_.
The sequence ends when the next step would have only one interval size,
according to `~`,
or when _maxDepth_, which may be omitted, is reached.

The familiar diatonic scale is the last item in the _5/12_ sequence:

```
>>> 5.momentOfSymmetry(12)
[
	5 7;
	5 5 2;
	3 2 3 2 2;
	1 2 2 1 2 2 2
]
```

The size of each step:

```
>>> 5.momentOfSymmetry(12)
>>> .collect(size:/1)
[2 3 5 7]
```

The symmetrical generator:

```
>>> 7.momentOfSymmetry(12)
[
	7 5;
	2 5 5;
	2 2 3 2 3;
	2 2 2 1 2 2 1
]
```

The interval pairs only of the _41/58_ sequence:

```
>>> 41.momentOfSymmetry(58)
>>> .collect(nub:/1)
[
	41 17;
	24 17;
	7 17;
	7 10;
	7 3;
	4 3;
	1 3;
	1 2
]
```

The fifth level of the _41/58_ sequence:

```
>>> 41.momentOfSymmetry(58).at(5)
[7 7 7 3 7 7 3 7 7 3]
```

_6L1s_ and _1L6s_ scales:

```
>>> 11.momentOfSymmetry(13).last
[1 2 2 2 2 2 2]

>>> 1.momentOfSymmetry(7).last
[1 1 1 1 1 2]
```

_5L2s_ and _2L5s_ scales:

```
>>> 7.momentOfSymmetry(12).last
[2 2 2 1 2 2 1]

>>> 4.momentOfSymmetry(9).last
[2 1 1 2 1 1 1]
```

The interval pairs only of the _22/49_ sequence:

```
>>> 22.momentOfSymmetry(49)
>>> .collect(nub:/1)
[
	22 27;
	22 5;
	17 5;
	12 5;
	7 5;
	2 5;
	2 3;
	2 1
]
```

The _58.33/100_ sequence, rounded:

```
>>> 58.3333.momentOfSymmetry(100)
>>> .rounded
[
	58 42;
	17 42 42;
	17 17 25 17 25;
	17 17 17 8 17 17 8
]
```

* * *

See also: isMomentOfSymmetry, Scale

References:
_Anaphoria_
[1](https://www.anaphoria.com/wilsonintroMOS.html)
