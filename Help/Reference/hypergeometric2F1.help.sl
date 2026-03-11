# hypergeometric2F1

- _hypergeometric2F1(a, b, c, z)_

Answer the hypergeometric function _₂F₁(a,b;c;z)_.

At `SmallFloat`:

```
>>> let [a, b, c] = [1 / 2, 1 / 3, 2];
>>> let z = 1;
>>> hypergeometric2F1(a, b, c, z)
1.159594

>>> let [a, b, c] = [2, 3, 4];
>>> let z = 1 / 2;
>>> hypergeometric2F1(a, b, c, z)
2.728935

>>> hypergeometric2F1(-3, -1, -2, 1)
-0.5

>>> hypergeometric2F1(
>>> 	-0.5, 1 / 3, 4 / 3, -1
>>> )
1.111448
```

At `Complex`:

```
>>> let [a, b, c] = [2J1, 0J-1, 3 / 4];
>>> let z = 0.5J-0.5;
>>> hypergeometric2F1(a, b, c, z)
-0.972167J-0.181659
```

Count a kind of Schröder tree,
OEIS [A010683](https://oeis.org/A010683):

```
>>> 1:9.collect { :n |
>>> 	2 * hypergeometric2F1(
>>> 		1 - n, n + 3, 2, -1
>>> 	)
>>> }
[2 7 28 121 550 2591 12536 61921 310954]
```

Calculate the Catalan numbers,
OEIS [A000108](https://oeis.org/A000108):

```
>>> 0:20.collect { :n |
>>> 	hypergeometric2F1(
>>> 		1 - n, -n, 2, 1
>>> 	)
>>> }
0:20.catalanNumber
```

Motzkin numbers,
OEIS [A001006](https://oeis.org/A001006):

```
>>> 0:11.collect { :n |
>>> 	hypergeometric2F1(
>>> 		(1 - n) / 2, -n / 2, 2, 4
>>> 	)
>>> }
[1 1 2 4 9 21 51 127 323 835 2188 5798]
```

Central trinomial coefficients,
OEIS [A002426](https://oeis.org/A002426):

```
>>> 0:11.collect { :n |
>>> 	(3 ^ n) * hypergeometric2F1(
>>> 		0.5, -n, 1, 4/3
>>> 	)
>>> }
[1 1 3 7 19 51 141 393 1107 3139 8953 25653]
```

Plot varying _z_ over a subset of the reals:

~~~spl svg=A
let [a, b, c] = [1 / 3, 1 / 3, 2 / 3];
(-1 -- 1).functionPlot { :z |
	hypergeometric2F1(
		a, b, c, z
	).clip([0 1.5])
}
~~~

![](sw/spl/Help/Image/hypergeometric2F1-A.svg)

Plot varying _z_ for three distinct _c_:

~~~spl svg=B
(-1 -- 1).functionPlot(
	[2 3 5].collect { :n |
		{ :z |
			hypergeometric2F1(
				1, 0.5, n.sqrt, z
			).clip([0 2])
		}
	}
)
~~~

![](sw/spl/Help/Image/hypergeometric2F1-B.svg)

The number of Schroeder paths of length _2n_ and having _k_ peaks at height one,
OEIS [A104219](https://oeis.org/A104219):

~~~spl svg=C
0:11.triangularArray { :n :k |
	(-1 ^ (n - k))
	*
	binomial(n, k)
	*
	hypergeometric2F1(
		k - n, n + 1, k + 2, 2
	)
}.catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/hypergeometric2F1-C.svg)

_₂F₁(-2k,2k-2n;1;-1)_,
OEIS [A184879](https://oeis.org/A184879):

~~~spl svg=D
0:10.triangularArray { :n :k |
	hypergeometric2F1(
		-2 * k, (2 * k) - (2 * n), 1, -1
	)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/hypergeometric2F1-D.svg)

* * *

See also: beta, legendreP, pochhammer

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HypergeometricFunction.html)
[2](https://reference.wolframcloud.com/language/ref/Hypergeometric2F1.html),
_OEIS_
[1](https://oeis.org/A010683),
_W_
[1](https://en.wikipedia.org/wiki/Hypergeometric_function)
