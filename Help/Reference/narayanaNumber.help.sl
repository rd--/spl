# narayanaNumber

- _narayanaNumber(n, k)_

The Narayana numbers form a triangular array of natural numbers,
called the Narayana triangle,
that occur in various counting problems.

Narayana numbers,
OEIS [A001263](https://oeis.org/A001263):

```
>>> 1:8.triangularArray(
>>> 	narayanaNumber:/2
>>> )
[
	1;
	1 1;
	1 3 1;
	1 6 6 1;
	1 10 20 10 1;
	1 15 50 50 15 1;
	1 21 105 175 105 21 1;
	1 28 196 490 490 196 28 1
]
```

Narayana numbers,
OEIS [A001263](https://oeis.org/A001263):

~~~spl svg=A oeis=A001263
1:11.triangularArray(
	narayanaNumber:/2
).catenate.discretePlot.log
~~~

![](Help/Image/narayanaNumber-A.svg)

* * *

See also: binomial, catalanNumber, delannoyNumber, dyckWords, narayanaSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NarayanaNumber.html)
[2](https://mathworld.wolfram.com/NarayanaTriangle.html),
_OEIS_
[1](https://oeis.org/A001263),
_W_
[1](https://en.wikipedia.org/wiki/Narayana_number)
