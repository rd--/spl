# bitIff

- _bitIff(p, q)_

Answer the bitwise _iff_ of _p_ and _q_,
also called the exclusive not-or operation.
Each output bit is one if the corresponding inputs bits are equal,
else false.

Illustrate in radix two notation:

```
>>> let p = 2r110001010110111;
>>> let q = 2r011001001000101;
>>> let r = 2r010111100001101;
>>> p.bitIff(q) = r
true
```

_1+Iff(k-1,n-k)_,
OEIS [A327490](https://oeis.org/A327490):

```
>>> 1:12.triangularArray { :n :k |
>>> 	1 + bitIff(k - 1, n - k)
>>> }
[
	1;
	1 1;
	2 2 2;
	1 1 1 1;
	4 2 4 2 4;
	3 3 3 3 3 3;
	2 4 2 4 2 4 2;
	1 1 1 1 1 1 1 1;
	8 2 4 2 8 2 4 2 8;
	7 7 3 3 7 7 3 3 7 7;
	6 8 6 4 6 8 6 4 6 8 6;
	5 5 5 5 5 5 5 5 5 5 5 5
]
```

Josephus problem,
OEIS [A006257](https://oeis.org/A006257):

```
>>> 0:23.collect { :n |
>>> 	2 * n - bitIff(n, n)
>>> }
[
	0  1  1  3  1  3 5 7 1 3
	5  7  9 11 13 15 1 3 5 7
	9 11 13 15
]
```

_2^n_ repeated _2^(n-1)_ times,
OEIS [A062383](https://oeis.org/A062383):

```
>>> 0:9.collect { :n |
>>> 	1 + bitIff(n, n)
>>> }
[1 2 4 4 8 8 8 8 16 16]
```

_1+Iff(k-1,n-k)_,
OEIS [A327490](https://oeis.org/A327490):

~~~spl svg=A oeis=A327490
1:12.triangularArray { :n :k |
	1 + bitIff(k - 1, n - k)
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/bitIff-A.svg)

A sequence by Clark Kimberling,
OEIS [A050057](https://oeis.org/A050057):

~~~spl svg=B oeis=A050057
let a = Map { :n |
	(n < 4).if {
		[1 3 1].at(n)
	} {
		let m = n - 2;
		a[n - 1] + a[bitIff(m, m) + 3 - n]
	}
};
a[1:85].log.scatterPlot
~~~

![](sw/spl/Help/Image/bitIff-B.svg)

* * *

See also: bitAnd, bitNot, bitOr

Guides: Bitwise Functions

References:
_Maple_
[1](https://www.maplesoft.com/support/help/maple/view.aspx?path=Bits%2FIff),
_Mathematica_
[1](https://mathworld.wolfram.com/Iff.html)
[2](https://mathworld.wolfram.com/XNOR.html),
_W_
[1](https://en.wikipedia.org/wiki/If_and_only_if)
