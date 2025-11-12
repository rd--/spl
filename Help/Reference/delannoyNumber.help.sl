# delannoyNumber

- _delannoyNumber(m, n)_

The Delannoy number _D_ counts the paths from the southwest corner _(0, 0)_ of a rectangular grid to the northeast corner _(m, n)_, using only single steps north, northeast, or east.

```
>>> { :m :n |
>>> 	m.delannoyNumber(n)
>>> }.table(0:9, 0:6)
[
	1  1  1    1     1     1     1;
	1  3  5    7     9    11    13;
	1  5 13    25   41    61    85;
	1  7 25    63  129   231   377;
	1  9 41   129  321   681  1289;
	1 11 61   231  681  1683  3653;
	1 13 85   377 1289  3653  8989;
	1 15 113  575 2241  7183 19825;
	1 17 145  833 3649 13073 40081;
	1 19 181 1159 5641 22363 75517
]
```

Plot modulo three:

~~~spl png=A
{ :m :n |
	(m.delannoyNumber(n) % 3) / 2
}.table(0:80, 0:80).Greymap
~~~

![](sw/spl/Help/Image/delannoyNumber-A.png)

* * *

See also: binomial, catalanNumber, delannoySequence, dyckWords, narayanaSequence

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DelannoyNumber.html),
_OEIS_
[1](https://oeis.org/A008288),
[2](https://oeis.org/A001850)
_W_
[1](https://en.wikipedia.org/wiki/Delannoy_number)
