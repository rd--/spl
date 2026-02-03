# eulerPhiInverse

- _eulerPhiInverse(n)_

Answer the inverse of the Euler totient function,
written _φ(n)_.
Answers an empty list for all odd number except one.

At specific values:

```
>>> 48.eulerPhiInverse
[
	 65 104 105 112 130
	140 144 156 168 180
	210
]

>>> [
>>> 	65 104 105 112 130
>>> 	140 144 156 168 180
>>> 	210
>>> ].collect(eulerPhi:/1)
[48 48 48 48 48 48 48 48 48 48 48]

>>> 100.eulerPhiInverse
[101 125 202 250]

>>> [101 125 202 250]
>>> .collect(eulerPhi:/1)
[100 100 100 100]
```

First few terms,
OEIS [A058812](https://oeis.org/A058812),
threads over lists:

```
>>> 1:10.eulerPhiInverse
[
	1 2;
	3 4 6;
	;
	5 8 10 12;
	;
	7 9 14 18;
	;
	15 16 20 24 30;
	;
	11 22
]
```

Count items per term,
OEIS [A014197](https://oeis.org/A014197):

```
>>> 1:25.eulerPhiInverse.collect(size:/1)
[
	2 3 0  4 0 4 0 5 0 2
	0 6 0  0 0 6 0 4 0 5
	0 2 0 10 0
]
```

Numbers _k_ such that _φ(x)=k_ has exactly two solutions,
OEIS [A007366](https://oeis.org/A007366):

```
>>> 1:50.select { :x |
>>> 	x.eulerPhiInverse.size = 2
>>> }
[1 10 22 28 30 46]
```

Values not in range of Euler phi function,
OEIS [A007617](https://oeis.org/A007617):

```
>>> 1:50.select { :x |
>>> 	x.eulerPhiInverse.size = 0
>>> }
[
	 3  5  7  9 11 13 14 15 17 19
	21 23 25 26 27 29 31 33 34 35
	37 38 39 41 43 45 47 49 50
]
```

Scatter plot of first few terms,
OEIS [A032447](https://oeis.org/A032447):

~~~spl svg=A
1:50.eulerPhiInverse
.++
.scatterPlot
~~~

![](sw/spl/Help/Image/eulerPhiInverse-A.svg)

* * *

See also: eulerPhi

Guides: Integer Sequence Functions

References:
_Magma_
[1](https://magma.maths.usyd.edu.au/magma/handbook/text/182),
_Maple_
[1](https://www.maplesoft.com/support/help/maple/view.aspx?path=NumberTheory%2fInverseTotient),
_Mathematica_
[1](https://mathworld.wolfram.com/TotientFunction.html)
[2](https://mathworld.wolfram.com/TotientValenceFunction.html)
[3](https://resources.wolframcloud.com/FunctionRepository/resources/EulerPhiInverse/),
_OEIS_
[1](https://oeis.org/A032447)
[2](https://oeis.org/A058812)
[3](https://oeis.org/A014197)
[4](https://oeis.org/A007617),
_W_
[1](https://en.wikipedia.org/wiki/Euler%27s_totient_function)

Unicode: U+03C6 φ Greek Small Letter Phi

Categories: Math
