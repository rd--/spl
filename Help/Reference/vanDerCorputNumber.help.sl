# vanDerCorputNumber

- _vanDerCorputNumber(n, base)_

A van der Corput sequence is a low-discrepancy sequence over the unit interval,
first published in 1935 by the Dutch mathematician J. G. van der Corput.
This function is also called the radical inverse.

The base-10 radical inverse of 42:

```
>>> 42.vanDerCorputNumber(10)
6/25
```

The base-2 radical inverse of 42:

```
>>> 42.vanDerCorputNumber(2)
21/64
```

Threads over lists:

```
>>> [31 32 33].vanDerCorputNumber(2)
[31/32 1/64 33/64]
```

Binary van der Corput sequence (OEIS A030101):

```
>>> 0:9.vanDerCorputNumber(2)
[0 1/2 1/4 3/4 1/8 5/8 3/8 7/8 1/16 9/16]

>>> let v = 0:19.vanDerCorputNumber(2);
>>> v.numerator
[
	0 1 1 3 1 5 3 7 1 9 5
	13 3 11 7 15 1 17 9 25
]
```

Ternary van der Corput sequence (OEIS A030102):

```
>>> 0:9.vanDerCorputNumber(3)
[0 1/3 2/3 1/9 4/9 7/9 2/9 5/9 8/9 1/27]

>>> let v = 0:19.vanDerCorputNumber(3);
>>> v.numerator
[
	0 1 2 1 4 7 2 5 8 1
	10 19 4 13 22 7 16 25 2 11
]
```

Quaternary van der Corput sequence:

```
>>> 0:9.vanDerCorputNumber(4)
[0 1/4 1/2 3/4 1/16 5/16 9/16 13/16 1/8 3/8]

>>> let v = 0:19.vanDerCorputNumber(4);
>>> v.numerator
[
	0 1 1 3 1 5 9 13 1 3
	5 7 3 7 11 15 1 17 33 49
]
```

The numerator is the reverse of the radix-_k_ representation:

```
>>> let k = 2;
>>> let n = 47;
>>> n.vanDerCorputNumber(k).numerator
n.integerDigits(k).reversed.fromDigits(k)
```

Plot decimal sequence:

~~~spl svg=A
1:100.vanDerCorputNumber(10)
.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-A.svg)

Plot numerators of decimal sequence:

~~~spl svg=B
1:100.vanDerCorputNumber(10)
.numerator
.discretePlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-B.svg)

Plot the binary radical inverse:

~~~spl svg=C
1:100
.vanDerCorputNumber(2)
.discretePlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-C.svg)

Plot progressive filling of the interval _(0,1)_:

~~~spl svg=D
1:100.collect { :i |
	[i.vanDerCorputNumber(10), i]
}.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-D.svg)

Plot sorted binary sequence of length 2⁶:

~~~spl svg=E
1:64.vanDerCorputNumber(2)
.sort
.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-E.svg)

Show decimal sequence at length hafway between 10ⁱ and 10²:

~~~spl svg=F
1:55.vanDerCorputNumber(10)
.sort
.scatterPlot
~~~

![](sw/spl/Help/Image/vanDerCorputNumber-F.svg)

* * *

See also: fromDigits, haltonSequence, integerDigits

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/vanderCorputSequence.html),
_OEIS_
[1](https://oeis.org/A030101)
[2](https://oeis.org/A030102),
_W_
[1](https://en.wikipedia.org/wiki/Van_der_Corput_sequence)

Further Reading: van der Corput 1935

Categories: Math, Sequence
