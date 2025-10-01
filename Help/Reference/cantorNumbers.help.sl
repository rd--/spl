# cantorNumbers

- _cantorNumbers(n)_

Answer the first _n_ Cantor numbers,
the numbers whose ternary expansion contain no ones.

First few terms:

```
>>> 56.cantorNumbers
[
	  0   2   6   8  18
	 20  24  26  54  56
	 60  62  72  74  78
	 80 162 164 168 170
	180 182 186 188 216
	218 222 224 234 236
	240 242 486 488 492
	494 504 506 510 512
	540 542 546 548 558
	560 564 566 648 650
	654 656 666 668 672
	674
]
```

Plot first few terms:

~~~spl svg=A
192.cantorNumbers.scatterPlot
~~~

![](sw/spl/Help/Image/cantorNumbers-A.svg)

* * *

See also: digitCount, stanleySequence

Guides: Integer Sequences

References:
_OEIS_
[1](https://oeis.org/A005823),
_W_
[1](https://en.wikipedia.org/wiki/K-regular_sequence)
[2](https://en.wikipedia.org/wiki/Cantor_set)
