# kaprekarMap

- _kaprekarMap(n, b=10, k)_

Answer the Kaprekar map of _n_ in base _b_.

First few terms,
_b=10_,
OEIS [A151949](https://oeis.org/A151949):

```
>>> 0:50.collect(kaprekarMap:/1)
[
	 0  0  0  0  0  0  0  0  0  0
	 9  0  9 18 27 36 45 54 63 72
	18  9  0  9 18 27 36 45 54 63
	27 18  9  0  9 18 27 36 45 54
	36 27 18  9  0  9 18 27 36 45
	45
]
```

First few terms,
_b=2_,
OEIS [A164884](https://oeis.org/A164884):

```
>>> 0:20.collect { :n |
>>> 	n.kaprekarMap(2)
>>> }
[
	 0  0  1  0  3  3  3  0  7  9
	 9  7  9  7  7  0 15 21 21 21
	21
]
```

First few terms,
_b=10_,
discrete plot,
OEIS [A151949](https://oeis.org/A151949):

~~~spl svg=A
0:99.collect(kaprekarMap:/1).discretePlot
~~~

![](sw/spl/Help/Image/kaprekarMap-A.svg)

First few terms,
_b=10_,
scatter plot,
OEIS [A151949](https://oeis.org/A151949):

~~~spl svg=B
0:250.collect(kaprekarMap:/1).scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-B.svg)

First few terms,
_b=2_,
scatter plot,
OEIS [A164884](https://oeis.org/A164884):

~~~spl svg=C
0:250.collect { :n |
	n.kaprekarMap(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-C.svg)

First few terms,
_b=3_,
scatter plot,
OEIS [A164993](https://oeis.org/A164993):

~~~spl svg=D
0:250.collect { :n |
	n.kaprekarMap(3)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-D.svg)

First few terms,
_b=4_,
scatter plot,
OEIS [A165012](https://oeis.org/A165012):

~~~spl svg=E
0:250.collect { :n |
	n.kaprekarMap(4)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-E.svg)

First few terms,
_b=5_,
scatter plot,
OEIS [A165032](https://oeis.org/A165032):

~~~spl svg=F
0:250.collect { :n |
	n.kaprekarMap(5)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-F.svg)

First few terms,
_b=6_,
scatter plot,
OEIS [A165051](https://oeis.org/A165051):

~~~spl svg=G
0:250.collect { :n |
	n.kaprekarMap(6)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-G.svg)

First few terms,
_b=7_,
scatter plot,
OEIS [A165071](https://oeis.org/A165071):

~~~spl svg=H
0:250.collect { :n |
	n.kaprekarMap(7)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-H.svg)

First few terms,
_b=8_,
scatter plot,
OEIS [A165090](https://oeis.org/A165090):

~~~spl svg=I
0:250.collect { :n |
	n.kaprekarMap(8)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-I.svg)

First few terms,
_b=9_,
scatter plot,
OEIS [A165110](https://oeis.org/A165110):

~~~spl svg=J
0:250.collect { :n |
	n.kaprekarMap(9)
}.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-J.svg)

Length of preperiodic part of trajectory of _n_ under iteration of the base-two Kaprekar map,
OEIS [A164885](https://oeis.org/A164885),
one less than
OEIS [A164886](https://oeis.org/A164886):

~~~spl svg=K
0:85.collect { :n |
	{ :x |
		x.kaprekarMap(2)
	}.fixedPointList(n, =).size - 2
}.discretePlot
~~~

![](sw/spl/Help/Image/kaprekarMap-K.svg)

Some later terms of the _b=10_ map,
divided by nine,
OEIS [A151950](https://oeis.org/A151950):

~~~spl svg=L
(1600:1900.collect(kaprekarMap:/1) / 9)
.scatterPlot
~~~

![](sw/spl/Help/Image/kaprekarMap-L.svg)

* * *

See also: fromDigits, integerDigits, kaprekarSequence, sort

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KaprekarRoutine.html)
[2](https://mathworld.wolfram.com/KaprekarsConstant.html),
_W_
[1](https://en.wikipedia.org/wiki/Kaprekar%27s_routine)
