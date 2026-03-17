# balancedTernaryDigits

- _balancedTernaryDigits(n)_

Answer a `List` of the balanced ternary digits of the integer _n_.

```
>>> 0:23.collect { :n |
>>> 	let d = n.balancedTernaryDigits;
>>> 	n -> d
>>> }
[
	0 -> [],
	1 -> [1],
	2 -> [1 -1],
	3 -> [1 0],
	4 -> [1 1],
	5 -> [1 -1 -1],
	6 -> [1 -1 0],
	7 -> [1 -1 1],
	8 -> [1 0 -1],
	9 -> [1 0 0],
	10 -> [1 0 1],
	11 -> [1 1 -1],
	12 -> [1 1 0],
	13 -> [1 1 1],
	14 -> [1 -1 -1 -1],
	15 -> [1 -1 -1 0],
	16 -> [1 -1 -1 1],
	17 -> [1 -1 0 -1],
	18 -> [1 -1 0 0],
	19 -> [1 -1 0 1],
	20 -> [1 -1 1 -1],
	21 -> [1 -1 1 0],
	22 -> [1 -1 1 1],
	23 -> [1 0 -1 -1]
]
```

`fromDigits` will convert from balanced ternary digits:

```
>>> [0 .. 23]
>>> .balancedTernaryDigits
>>> .collect { :n |
>>> 	n.fromDigits(3)
>>> }
[0 .. 23]
```

Matrix plot of first few terms:

~~~spl svg=A
0:26.balancedTernaryDigits
.padLeft
.transpose
.rescale
.matrixPlot
~~~

![](Help/Image/balancedTernaryDigits-A.svg)

Compare to equivalent ternary plot:

~~~spl svg=B
0:26.integerDigits(3)
.padLeft
.transpose
.rescale
.matrixPlot
~~~

![](Help/Image/balancedTernaryDigits-B.svg)

* * *

See also: fromDigits, integerDigits

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html)
_W_
[1](https://en.wikipedia.org/wiki/Balanced_ternary)
