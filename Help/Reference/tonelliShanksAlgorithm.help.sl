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
```

At large integer:

```
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

>>> let n = [
>>> 	3 4 0 3 5 2 4 3 9 1
>>> 	4 6 3 5 5 4 9 6 0 1
>>> 	5 8 3 3 6 9 5 4 4 5
>>> 	6 0 6 5 0 2 5 4 3 2
>>> 	5 0 8 4 6 4 3 2 0 1
>>> ].fromDigits(10L);
>>> let m = [
>>> 	8 2 5 6 3 1 1 8 8 2
>>> 	8 0 9 0 3 6 2 2 6 1
>>> 	3 7 8 9 9 3 9 5 7 4
>>> 	5 0 2 1 3 5 7 3 6 8
>>> 	7 1 1 3 6 9 0 7 5 1
>>> ].fromDigits(10L);
>>> let p = 10L ^ 50 + 151;
>>> let q = tonelliShanksAlgorithm(n, p);
>>> (q, (m ^ 2) % (10L ^ 50 + 151))
(m, n)

>>> let n = [
>>> 	4 1 6 6 0 8 1 5 1 2
>>> 	7 6 3 7 3 4 7 4 6 8
>>> 	1 4 0 7 4 5 0 4 2 8
>>> 	2 7 7 0 4 1 0 3 4 4
>>> 	5 7 5 0 1 7 2 0 0 2
>>> ].fromDigits(10L);
>>> let m = [
>>> 	3 2 1 0 2 9 8 5 3 6
>>> 	9 9 4 0 6 2 0 8 4 9
>>> 	7 4 1 9 8 3 9 8 7 3
>>> 	0 0 0 3 8 9 0 3 7 2
>>> 	5 2 6 6 6 3 4 5 0 8
>>> ].fromDigits(10L);
>>> let p = 10L ^ 50 + 577;
>>> let q = tonelliShanksAlgorithm(n, p);
>>> (q, (m ^ 2) % (10L ^ 50 + 577))
(m, n)
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

Guides: Prime Number Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Tonelli%E2%80%93Shanks_algorithm)
