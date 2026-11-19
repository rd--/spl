# periodDoublingSequence

- _periodDoublingSequence(n)_

Answer the first _n_ terms of the period doubling sequence,
also called the period-doubling word,
the fixed point of the morphism _0→01,1→00_.

The period doubling sequence,
OEIS [A096268](https://oeis.org/A096268):

```
>>> 105L.periodDoublingSequence
[
	0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0
	0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 1
	0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0
	0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0
	0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0
	0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 1
	0 1 0 0 0 1 0 1 0
]
```

The complement of the period doubling sequence,
OEIS [A035263](https://oeis.org/A035263):

```
>>> 1L - 105L.periodDoublingSequence
[
	1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 1
	1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
	1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 1
	1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 1
	1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 1
	1 0 1 1 1 0 1 0 1 0 1 1 1 0 1 0
	1 0 1 1 1 0 1 0 1
]
```

In terms of `substitutionSystem`:

```
>>> [0 -> [1 0], 1 -> [0 0]]
>>> .substitutionSystem([0], 6).catenate
127.periodDoublingSequence

>>> [1 -> [0 1], 0 -> [1 1]]
>>> .substitutionSystem([1], 6).catenate
1 - 127.periodDoublingSequence
```

The period doubling sequence,
OEIS [A096268](https://oeis.org/A096268):

~~~spl svg=A oeis=A096268
115L.periodDoublingSequence
.discretePlot
~~~

![](Help/Image/periodDoublingSequence-A.svg)

A sequence that is distinct from but similar to the period doubling sequence,
OEIS [A073059](https://oeis.org/A073059):

~~~spl svg=B oeis=A073059
let a = Map { :n |
	[
		{ n = 1L } -> { 0L },
		{ n % 2L = 0L } -> { 0L },
		{ n % 4L = 3L } -> { 1L },
		{ true } -> { a[(n - 1L) // 4] }
	].which
};
a[1L .. 105L].discretePlot
~~~

![](Help/Image/periodDoublingSequence-B.svg)

A sequence that is distinct from but similar to the complement of the period doubling sequence,
OEIS [A098725](https://oeis.org/A098725):

~~~spl svg=C oeis=A098725
let a = Map { :n |
	[
		{ n % 2L = 1L } -> { 1L },
		{ n % 4L = 0L } -> { 0L },
		{ true } -> { a[(n - 2L) // 4L + 1L] }
	].which
};
a[0L .. 101L].discretePlot
~~~

![](Help/Image/periodDoublingSequence-C.svg)

The complement of the period doubling sequence,
OEIS [A035263](https://oeis.org/A035263):

~~~spl svg=D oeis=A035263
(1L - 105L.periodDoublingSequence)
.discretePlot
~~~

![](Help/Image/periodDoublingSequence-D.svg)

* * *

See also: regularPaperfoldingSequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A096268)
