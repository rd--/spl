# eulerUpDownNumber

- _eulerUpDownNumber(n)_

Answer the _n-th_ Euler up/down number,
also called the Euler zigzag number.

The Euler or up/down numbers,
OEIS [A000111](https://oeis.org/A000111):

```
>>> 0:26.collect(
>>> 	eulerUpDownNumber:/1
>>> )
[
	1
	1
	1
	2
	5
	16
	61
	272
	1385
	7936
	50521
	353792
	2702765
	22368256
	199360981
	1903757312
	19391512145
	209865342976
	2404879675441
	29088885112832
	370371188237525
	4951498053124096
	69348874393137901L
	1015423886506852352L
	15514534163557086905L
	246921480190207983616L
	4087072509293123892361L
]
```

For even _n_ answers the absolute value of the _n_-th Euler number:

```
>>> 0:2:26.collect(
>>> 	eulerUpDownNumber:/1
>>> )
0:2:26.collect(eulerNumber:/1).abs
```

* * *

See also: bernoulliNumber, eulerNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerZigzagNumber.html),
_OEIS_
[1](https://oeis.org/A000111),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.andre),
_W_
[1](https://en.wikipedia.org/wiki/Alternating_permutation)
