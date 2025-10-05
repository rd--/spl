# moserDeBruijnSequence

- _moserDeBruijnSequence(n)_

Answer the first _n_ terms of the the Moser–de Bruijn sequence,
an integer sequence consisting of the sums of distinct powers of four.

```
>>> 51.moserDeBruijnSequence
[
	0 1 4 5 16
	17 20 21 64 65
	68 69 80 81 84
	85 256 257 260 261
	272 273 276 277 320
	321 324 325 336 337
	340 341 1024 1025 1028
	1029 1040 1041 1044 1045
	1088 1089 1092 1093 1104
	1105 1108 1109 1280 1281
	1284
]
```

Equivalently, they are the numbers whose binary representations are nonzero only in even positions:

```
>>> 23.moserDeBruijnSequence.collect { :each |
>>> 	each.integerDigits(2)
>>> }
[
	0;
	1;
	1 0 0;
	1 0 1;
	1 0 0 0 0;
	1 0 0 0 1;
	1 0 1 0 0;
	1 0 1 0 1;
	1 0 0 0 0 0 0;
	1 0 0 0 0 0 1;
	1 0 0 0 1 0 0;
	1 0 0 0 1 0 1;
	1 0 1 0 0 0 0;
	1 0 1 0 0 0 1;
	1 0 1 0 1 0 0;
	1 0 1 0 1 0 1;
	1 0 0 0 0 0 0 0 0;
	1 0 0 0 0 0 0 0 1;
	1 0 0 0 0 0 1 0 0;
	1 0 0 0 0 0 1 0 1;
	1 0 0 0 1 0 0 0 0;
	1 0 0 0 1 0 0 0 1;
	1 0 0 0 1 0 1 0 0
]
```

Plot first few terms:

~~~spl svg=A
63.moserDeBruijnSequence.scatterPlot
~~~

![](sw/spl/Help/Image/moserDeBruijnSequence-A.svg)

* * *

See also: fromDigits, integerDigits

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Moser-deBruijnSequence.html),
_OEIS_
[1](https://oeis.org/A000695),
_W_
[1](https://en.wikipedia.org/wiki/Moser%E2%80%93de_Bruijn_sequence)
