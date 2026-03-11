# schroderSequence

- _schroderSequence(k)_

Answer the first _k_ Schröder numbers,
also called the large Schröder numbers or big Schröder numbers.

The Schröder numbers,
OEIS [A006318](https://oeis.org/A006318):

```
>>> 25.schroderSequence
[
	1
	2
	6
	22
	90
	394
	1806
	8558
	41586
	206098
	1037718
	5293446
	27297738
	142078746
	745387038
	3937603038
	20927156706
	111818026018
	600318853926
	3236724317174
	17518619320890
	95149655201962
	518431875418926
	2832923350929742
	15521467648875090L
]
```

The Schröder numbers are twice the super-Catalan numbers,
which are also called the little-Schröder numbers,
OEIS [A001003](https://oeis.org/A001003)

```
>>> 1:9.schroderNumber / 2
[1 1 3 11 45 197 903 4279 20793]

>>> 1:9.superCatalanNumber
[1 1 3 11 45 197 903 4279 20793]

>>> 1:9.superCatalanNumber * 2
[2 2 6 22 90 394 1806 8558 41586]

>>> 1:9.schroderNumber
[2 2 6 22 90 394 1806 8558 41586]
```

The Schröder numbers,
OEIS [A006318](https://oeis.org/A006318):

~~~spl svg=A
25.schroderSequence.log.discretePlot
~~~

![](sw/spl/Help/Image/schroderSequence-A.svg)

* * *

See also: delannoySequence, schroderNumber, superCatalanNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SchroederNumber.html),
_OEIS_
[1](https://oeis.org/A006318),
_W_
[1](https://en.wikipedia.org/wiki/Schr%C3%B6der_number)
