# strophoid

- _strophoid(a)_

Curve studied by Barrow in 1669 and by Quételet in 1810.

Line drawing:

~~~spl svg=A
(-0.4.pi -- 0.4.pi).discretize(
	100,
	1/2.pi.strophoid
).Line
~~~

![](sw/spl/Help/Image/strophoid-A.svg)

~~~spl svg=B
(-0.7.pi -- 0.1.pi).discretize(
	100,
	1/8.pi.strophoid
).Line
~~~

![](sw/spl/Help/Image/strophoid-B.svg)

~~~spl svg=C
(-0.25.pi -- 0.55.pi).discretize(
	100,
	2/3.pi.strophoid
).Line
~~~

![](sw/spl/Help/Image/strophoid-C.svg)

* * *

See also: cochleoid

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Strophoid.html)
_W_
[1](https://en.wikipedia.org/wiki/Strophoid)
