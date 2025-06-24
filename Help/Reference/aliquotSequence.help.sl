# aliquotSequence

- _aliquotSequence(n, k=21)_

Answer the aliquot sequence, to at most _k_ places.

A sequence that ends at `one`:

```
>>> 10.aliquotSequence
[10 8 7 1]
```

A perfect number has a repeating aliquot sequence of period one:

```
>>> 6.aliquotSequence
[6]
```

An amicable number has a repeating aliquot sequence of period two:

```
>>> 220.aliquotSequence
[220 284]
```

Aspiring numbers are eventually periodic:

```
>>> 95.aliquotSequence
[95 25 6]
```

The first few sequences:

```
>>> 1:9.collect(aliquotSequence:/1)
[
	1;
	2 1;
	3 1;
	4 3 1;
	5 1;
	6;
	7 1;
	8 7 1;
	9 4 3 1
]

>>> 23:27.collect(aliquotSequence:/1)
[
	23 1;
	24 36 55 17 1;
	25 6;
	26 16 15 9 4 3 1;
	27 13 1
]
```

The length of the first few sequences:

```
>>> 1:50.collect { :n |
>>> 	n.aliquotSequence.size
>>> }
[
	1 2 2 3 2 1 2 3 4 4
	2 7 2 5 5 6 2 4 2 7
	3 6 2 5 2 7 3 1 2 15
	2 3 6 8 3 4 2 7 3 4
	2 14 2 5 7 8 2 6 4 3
]
```

It not known if the some aliquot sequences terminate:

```
>>> 276.aliquotSequence(11)
[
	276 396 696 1104 1872 3770 3790 3050 2716 2772 5964
]

* * *

See also: aliquotSum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AliquotSequence.html),
_OEIS_
[1](https://oeis.org/A044050),
_W_
[1](https://en.wikipedia.org/wiki/Aliquot_sequence)
