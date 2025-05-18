# log2

- _log2(aNumber)_

The base two logarithm of _aNumber_.

```
>>> (2 ^ 10).log2
10

>>> (2 ^ 1/2).log2
1/2

>>> 2.sqrt.log2
1/2

>>> (2 ^ -1).log2
-1

>>> let n = system.nextRandomFloat;
>>> n.log2
(n.log / 2.log)
```

Log base two of the first few primes:

```
>>> 10.primesList.log2
[
	1.0000 1.5850 2.3220 2.8074 3.4594
	3.7004 4.0875 4.2480 4.5240 4.8580
]
```

The pitch of A4 in octaves above `one` hertz:

```
>>> 440.log2
8.7814

>>> 2 ^ 8.7814
440
```

The pitch of middle C (C4) in octaves above `one` hertz:

```
>>> 440.log2 - 9/12
8.0314

>>> 2 ^ (440.log2 - 9/12)
261.6256
```

Frequency of middle C (C4) in hertz:

```
>>> 2 ^ (440.log2 - 9/12)
261.6256

>>> 261.6256.CpsMidi
60
```

Plot over a subset of the reals:

~~~spl svg=A
(0.01 -- 5).functionPlot(log2:/1)
~~~

![](sw/spl/Help/Image/log2-A.svg)

* * *

See also: log, log10

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BinaryLogarithm.html)
[2](https://reference.wolfram.com/language/ref/Log2.html),
_W_
[1](https://en.wikipedia.org/wiki/Binary_logarithm),
_Xenharmonic_
[1](https://en.xen.wiki/w/Log2)
