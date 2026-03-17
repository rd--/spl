# vanDerLaanSequence

- _vanDerLaanSequence(n)_

Answer the first _n_ terms of the van der Laan sequence,
the number of compositions, ordered partitions, into parts two and three.
Also the expansion of _1/(1-x²-x³)_.

The first 23 entries of the van der Laan sequence,
OEIS [A182097](https://oeis.org/A182097):

```
>>> 23.vanDerLaanSequence
[
	1 0 1 1 1 2 2 3 4 5
	7 9 12 16 21 28 37 49 65 86
	114 151 200
]

>>> [0 1 1].linearRecurrence([1 0 1], 17)
[1 0 1 1 1 2 2 3 4 5 7 9 12 16 21 28 37]
```

The table of the eight van der Laan measures:

```
>>> [1 4/3 7/4 7/3 3/1 4/1 16/3 7/1]
>>> .ratios
[4/3 21/16 4/3 9/7 4/3 4/3 21/16]
```

The measures approximate seven iterations of multiplication by the plastic ratio:

```
>>> { :n |
>>> 	n * 1.plasticRatio
>>> }.nestList(1, 7).collect { :n |
>>> 	n.asFraction(0.08)
>>> }
[1/1 4/3 7/4 7/3 3/1 4/1 16/3 36/5]
```

The defining ratio is given by the expression:

```
>>> let r = 2 / (3/4 + (1/7 ^ 1/7));
>>> r - 1.plasticRatio < 0.005
true
```

The van der Laan sequence,
OEIS [A182097](https://oeis.org/A182097):

~~~spl svg=A oeis=A182097
35.vanDerLaanSequence
.discretePlot
~~~

![](Help/Image/vanDerLaanSequence-A.svg)

* * *

See also: padovanSequence, perrinSequence, plasticRatio

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A182097)

Further Reading: Spinadel 2009

Categories: Math, Sequence
