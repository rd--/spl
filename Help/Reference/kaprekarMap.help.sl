# kaprekarMap

- _kaprekarMap(n, b=10, k)_

Answer the Kaprekar map of _n_ in base _b_.

Kaprekar map,
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

Kaprekar map,
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

Kaprekar map,
_b=10_,
discrete plot,
OEIS [A151949](https://oeis.org/A151949):

~~~spl svg=A oeis=A151949
0:99.collect(kaprekarMap:/1).discretePlot
~~~

![](Help/Image/kaprekarMap-A.svg)

Kaprekar map,
_b=10_,
scatter plot,
OEIS [A151949](https://oeis.org/A151949):

~~~spl svg=B oeis=A151949
0:250.collect(kaprekarMap:/1).scatterPlot
~~~

![](Help/Image/kaprekarMap-B.svg)

Kaprekar map,
_b=2_,
scatter plot,
OEIS [A164884](https://oeis.org/A164884):

~~~spl svg=C oeis=A164884
0:250.collect { :n |
	n.kaprekarMap(2)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-C.svg)

Kaprekar map,
_b=3_,
scatter plot,
OEIS [A164993](https://oeis.org/A164993):

~~~spl svg=D oeis=A164993
0:250.collect { :n |
	n.kaprekarMap(3)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-D.svg)

Kaprekar map,
_b=4_,
scatter plot,
OEIS [A165012](https://oeis.org/A165012):

~~~spl svg=E oeis=A165012
0:250.collect { :n |
	n.kaprekarMap(4)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-E.svg)

Kaprekar map,
_b=5_,
scatter plot,
OEIS [A165032](https://oeis.org/A165032):

~~~spl svg=F oeis=A165032
0:250.collect { :n |
	n.kaprekarMap(5)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-F.svg)

Kaprekar map,
_b=6_,
scatter plot,
OEIS [A165051](https://oeis.org/A165051):

~~~spl svg=G oeis=A165051
0:250.collect { :n |
	n.kaprekarMap(6)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-G.svg)

Kaprekar map,
_b=7_,
scatter plot,
OEIS [A165071](https://oeis.org/A165071):

~~~spl svg=H oeis=A165071
0:250.collect { :n |
	n.kaprekarMap(7)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-H.svg)

Kaprekar map,
_b=8_,
scatter plot,
OEIS [A165090](https://oeis.org/A165090):

~~~spl svg=I oeis=A165090
0:250.collect { :n |
	n.kaprekarMap(8)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-I.svg)

Kaprekar map,
_b=9_,
scatter plot,
OEIS [A165110](https://oeis.org/A165110):

~~~spl svg=J oeis=A165110
0:250.collect { :n |
	n.kaprekarMap(9)
}.scatterPlot
~~~

![](Help/Image/kaprekarMap-J.svg)

Length of preperiodic part of trajectory of _n_ under iteration of the base-two Kaprekar map,
OEIS [A164885](https://oeis.org/A164885),
one less than
OEIS [A164886](https://oeis.org/A164886):

~~~spl svg=K oeis=A164885
0:85.collect { :n |
	{ :x |
		x.kaprekarMap(2)
	}.fixedPointList(n, =).size - 2
}.discretePlot
~~~

![](Help/Image/kaprekarMap-K.svg)

Some later terms of the _b=10_ map,
divided by nine,
OEIS [A151950](https://oeis.org/A151950):

~~~spl svg=L oeis=A151950
(1600:1900.collect(kaprekarMap:/1) / 9)
.scatterPlot
~~~

![](Help/Image/kaprekarMap-L.svg)

* * *

See also: fromDigits, integerDigits, kaprekarSequence, sort

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KaprekarRoutine.html)
[2](https://mathworld.wolfram.com/KaprekarsConstant.html),
_W_
[1](https://en.wikipedia.org/wiki/Kaprekar%27s_routine)
