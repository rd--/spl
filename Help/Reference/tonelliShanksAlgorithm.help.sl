# tonelliShanksAlgorithm

- _tonelliShanksAlgorithm(n, p)_

Solve _x_ for _x²≡n%p_,
where _p_ is a prime.
Answer one root, _r_, the second is _p-r_.

```
>>> tonelliShanksAlgorithm(5, 41)
28

>>> (28 ^ 2) % 41
5

>>> ((41 - 28) ^ 2) % 41
5

>>> tonelliShanksAlgorithm(10, 13)
7

>>> (7 ^ 2) % 13
10

>>> ((13 - 7) ^ 2) % 13
10

>>> tonelliShanksAlgorithm(48, 73)
11

>>> (11 ^ 2) % 73
48

>>> tonelliShanksAlgorithm(56, 101)
37

>>> (37 ^ 2) % 101
56

>>> tonelliShanksAlgorithm(8218, 10007)
9872

>>> (9872 ^ 2) % 10007
8218

>>> tonelliShanksAlgorithm(1030, 10009)
1632

>>> (1632 ^ 2) % 10009
1030

>>> tonelliShanksAlgorithm(
>>> 	44402, 100049
>>> )
30468

>>> (30468 ^ 2) % 100049
44402

>>> tonelliShanksAlgorithm(
>>> 	331575, 1000003
>>> )
144161

>>> (144161 ^ 2) % 1000003
331575

>>> tonelliShanksAlgorithm(
>>> 	665820697L, 1000000009L
>>> )
378633312L

>>> (378633312L ^ 2) % 1000000009L
665820697L

>>> tonelliShanksAlgorithm(
>>> 	881398088036L, 1000000000039L
>>> )
791399408049L

>>> (791399408049L ^ 2)
>>> %
>>> 1000000000039L
881398088036L
```

Plot the set of affine points of elliptic curve _y²=x³−x_ over finite field _F89_:

~~~spl svg=A
let p = UnivariatePolynomial([0 -1 0 1]);
let m = 89;
[0 .. m - 1].collect { :x |
	let a = p.at(x);
	(legendreSymbol(a, m) = 1).if {
		let r = tonelliShanksAlgorithm(a, m);
		[[x, r], [x, m - r]]
	} {
		[]
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/tonelliShanksAlgorithm-A.svg)

* * *

See also: ^, %, powerMod

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html)
_W_
[1](https://en.wikipedia.org/wiki/Tonelli%E2%80%93Shanks_algorithm)
