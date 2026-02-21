# sequenceCount

- _sequenceCount(l, x)_

Answer the number of times _x_ appears as a sublist of the list _l_.

Count the number of appearances of a sublist:

```
>>> [1 2 1 2 1 2].sequenceCount([1 2])
3
```

Count sequences of integers in a list:

```
>>> let r = Sfc32(789124);
>>> [1 .. 10].randomChoice(r, [10 ^ 3])
>>> .sequenceCount([3 .. 5])
4
```

Numbers whose binary representation contains no two adjacent ones,
OEIS [A003714](https://oeis.org/A003714):

```
>>> 0:99.select { :n |
>>> 	n.integerDigits(2)
>>> 	.sequenceCount([1 1]) = 0
>>> }
[
	 0  1  2  4  5  8  9 10 16 17
	18 20 21 32 33 34 36 37 40 41
	42 64 65 66 68 69 72 73 74 80
	81 82 84 85
]
```

Numbers whose binary representation contains no two adjacent zeroes,
called the dual Zeckendorf representation,
OEIS [A104326](https://oeis.org/A104326):

```
>>> 0:50.collect { :n |
>>> 	n.integerDigits(2)
>>> }.select { :n |
>>> 	n.sequenceCount([0 0]) = 0
>>> }
[
	0;
	1;
	1 0;
	1 1;
	1 0 1;
	1 1 0;
	1 1 1;
	1 0 1 0;
	1 0 1 1;
	1 1 0 1;
	1 1 1 0;
	1 1 1 1;
	1 0 1 0 1;
	1 0 1 1 0;
	1 0 1 1 1;
	1 1 0 1 0;
	1 1 0 1 1;
	1 1 1 0 1;
	1 1 1 1 0;
	1 1 1 1 1;
	1 0 1 0 1 0;
	1 0 1 0 1 1;
	1 0 1 1 0 1;
	1 0 1 1 1 0;
	1 0 1 1 1 1
]
```

Numbers with no adjacent zeroes in binary expansion,
OEIS [A003754](https://oeis.org/A003754):

```
>>> 0:85.select { :n |
>>> 	n.integerDigits(2)
>>> 	.sequenceCount([0 0]) = 0
>>> }
[
	 0  1  2  3  5  6  7 10 11 13
	14 15 21 22 23 26 27 29 30 31
	42 43 45 46 47 53 54 55 58 59
	61 62 63 85
]
```

Plot number of occurrences of _00_ in the binary expansion of _n_,
OEIS [A056973](http://oeis.org/A056973):

~~~spl svg=A
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([0 0])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-A.svg)

Plot number of occurrences of _01_ in the binary expansion of _n_,
OEIS [A037800](http://oeis.org/A037800):

~~~spl svg=B
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([0 1])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-B.svg)

Plot number of occurrences of _10_ in the binary expansion of _n_,
OEIS [A033264](http://oeis.org/A033264):

~~~spl svg=C
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([1 0])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-C.svg)

Plot number of occurrences of _11_ in the binary expansion of _n_,
OEIS [A014081](http://oeis.org/A014081):

~~~spl svg=D
0:65.collect { :n |
	n.binaryExpansion
	.sequenceCount([1 1])
}.discretePlot
~~~

![](sw/spl/Help/Image/sequenceCount-D.svg)

Plot number of occurrences of _111_ in the binary expansion of _n_,
OEIS [A014082](http://oeis.org/A014082):

~~~spl svg=E
0:150.collect { :n |
	n.binaryExpansion
	.sequenceCount([1 1])
}.scatterPlot
~~~

![](sw/spl/Help/Image/sequenceCount-E.svg)

* * *

See also: count, sequencePosition

Guides: Sequence Alignment Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequenceCount.html)
_OEIS_
[1](https://oeis.org/A003714)
[2](https://oeis.org/A104326)
[3](https://oeis.org/A003754)
