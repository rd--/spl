# stanleySequence

- _stanleySequence(n)_

Answer the first _n_ terms of the Stanley sequence,
the numbers whose ternary expansion contain no twos.

First few terms:

```
>>> 58.stanleySequence
[
	  0   1   3   4   9
	 10  12  13  27  28
	 30  31  36  37  39
	 40  81  82  84  85
	 90  91  93  94 108
	109 111 112 117 118
	120 121 243 244 246
	247 252 253 255 256
	270 271 273 274 279
	280 282 283 324 325
	327 328 333 334 336
	337 351 352
]
```

Plot first few terms:

~~~spl svg=A
192.stanleySequence.scatterPlot
~~~

![](sw/spl/Help/Image/stanleySequence-A.svg)

* * *

See also: digitCount, stanleySequence

Guides: Integer Sequences

References:
_OEIS_
[1](https://oeis.org/A005836),
_W_
[1](https://en.wikipedia.org/wiki/Stanley_sequence)
