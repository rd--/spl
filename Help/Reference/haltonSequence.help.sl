# haltonSequence

- _haltonSequence([b₁ b₂ …], n)_

Answer the first _n_ terms of the _(b₁,b₂…)_ Halton sequence.

The _(2,3)_ Halton sequence:

```
>>> [2 3].haltonSequence(9)
[
	1/2 1/3;
	1/4 2/3;
	3/4 1/9;
	1/8 4/9;
	5/8 7/9;
	3/8 2/9;
	7/8 5/9;
	1/16 8/9;
	9/16 1/27
]
```

The _(2,3,5)_ Halton sequence:

```
>>> [2 3 5].haltonSequence(9)
[
	 1/2   1/3   1/5;
	 1/4   2/3   2/5;
	 3/4   1/9   3/5;
	 1/8   4/9   4/5;
	 5/8   7/9  1/25;
	 3/8   2/9  6/25;
	 7/8   5/9 11/25;
	1/16   8/9 16/25;
	9/16  1/27 21/25
]
```

Relation to `vanDerCorputNumber`:

```
>>> [2 3].haltonSequence(8).transpose
[
	1/2 1/4 3/4 1/8 5/8 3/8 7/8 1/16;
	1/3 2/3 1/9 4/9 7/9 2/9 5/9 8/9
]

>>> 1:8.vanDerCorputNumber(2)
[1/2 1/4 3/4 1/8 5/8 3/8 7/8 1/16]

>>> 1:8.vanDerCorputNumber(3)
[1/3 2/3 1/9 4/9 7/9 2/9 5/9 8/9]
```

Plot first few terms of the _2,3_ Halton sequence:

~~~spl svg=A
[2 3].haltonSequence(100).scatterPlot
~~~

![](sw/spl/Help/Image/haltonSequence-A.svg)

As _b_ increases sample values can exhibit surprisingly regular patterns:

~~~spl svg=B
[29 31].haltonSequence(100).scatterPlot
~~~

![](sw/spl/Help/Image/haltonSequence-B.svg)

* * *

See also: hammersleyPointSet, kroneckerSequence, poissonDiskSampling, vanDerCorputNumber

Guides: Integer Sequence Functions, Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A030101)
[2](https://oeis.org/A030102),
_W_
[1](https://en.wikipedia.org/wiki/Halton_sequence)

Further Reading: Halton 1964, Kocis 1997
