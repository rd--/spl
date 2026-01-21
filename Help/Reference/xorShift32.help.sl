# xorShift32

- _xorShift32(n, ⍴)_

Implement the _xor_ algorithm of Marsaglia.
Answers an array of shape _⍴_ with initial value _n_.

First few terms:

```
>>> xorShift32(123456789, [11])
[
	  123456789
	-1579999415
	-2056153900
	 1250077441
	 -474866960
	-1117447610
	 -610828464
	-1143879506
	 -632459188
	  -52590674
	 -920365318
]
```

Step plot of first few terms:

~~~spl svg=A
123456789.xorShift32([99])
.rescale
.stepPlot
~~~

![](sw/spl/Help/Image/xorShift32-A.svg)

Plot histogram:

~~~spl svg=B
123456789.xorShift32([1E4])
.histogramPlot
~~~

![](sw/spl/Help/Image/xorShift32-B.svg)

Matrix plot:

~~~spl png=C
let n = 100;
123456789.xorShift32([n n])
.rescale
.Greymap
~~~

![](sw/spl/Help/Image/xorShift32-C.png)

* * *

See also: bitShiftLeft, bitShiftRightUnsigned, bitXor, Sfc32

Guides: Bitwise Functions, Integer Sequence Functions, Random Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Xorshift)

Further Reading: Marsaglia 2003
