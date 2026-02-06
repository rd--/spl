# lookAndSay

- _lookAndSay(n, b=10)_

Answer the look and say digits of _n_ in base _b_.

First few terms,
as integers,
OEIS [A045918](https://oeis.org/A045918):

```
>>> 0:15.collect { :n |
>>> 	n.lookAndSay.fromDigits
>>> }
[
	10 11 12 13 14 15 16 17 18 19
	1110 21 1112 1113 1114 1115
]
```

Select prime numbers with prime look and say sequences,
OEIS [A056815](https://oeis.org/A056815):

```
>>> 1:99.prime.select { :n |
>>> 	n.lookAndSay
>>> 	.fromDigits
>>> 	.isPrime
>>> }
[
	  3   7  17  23 113
	127 137 193 199 223
	233 271 311 313 331
	359 367 373 431 433
	439 463 479 499 503
	523
]
```

Plot a variant desribing the digit count,
OEIS [A047842](https://oeis.org/A047842):

~~~spl svg=A
0:49.collect { :n |
	0:9.collect { :k |
		[n.digitCount(10, k), k]
	}.select { :d |
		d[1] > 0
	}.catenate
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/lookAndSay-A.svg)

* * *

See also: lookAndSaySequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LookandSaySequence.html),
_OEIS_
[1](https://oeis.org/A045918)
[2](https://oeis.org/A056815),
_W_
[1](https://en.wikipedia.org/wiki/Look-and-say_sequence)
