# lobbNumber

- _lobbNumber(m, n)_

The Lobb number counts the number of ways that _n + m_ open parentheses,
and _n − m_ close parentheses,
can be arranged to form the start of a valid sequence of balanced parentheses.

Lobb numbers form a natural generalization of the Catalan numbers,
which count the number of complete strings of balanced parentheses of a given length.

```
>>> 0:6.collect { :m |
>>> 	0:m.collect { :n |
>>> 		n.lobbNumber(m)
>>> 	}
>>> }
[
	1;
	1 1;
	2 3 1;
	5 9 5 1;
	14 28 20 7 1;
	42 90 75 35 9 1;
	132 297 275 154 54 11 1
]
```

Plot first few terms:

~~~spl svg=A
0:19.collect { :m |
	0:m.collect { :n |
		n.lobbNumber(m)
	}
}.flatten.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/lobbNumber-A.svg)

* * *

See also: bellNumber, binomial, catalanNumber, narayanNumber

Guides: Integer Sequences

References:
_OEIS_
[1](https://oeis.org/A039599),
_W_
[1](https://en.wikipedia.org/wiki/Lobb_number)

Categories: Math, Combinatorics
