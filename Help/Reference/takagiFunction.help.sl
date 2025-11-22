# takagiFunction

- _takagiFunction(x, n=100)_

Implement the Takagi function,
a self-affine function that is continuous and nowhere differentiable.

Specific values:

```
>>> 2.takagiFunction
0

>>> (12 / 19).takagiFunction
6296 / 9709

>>> 1.273.takagiFunction
0.58655787484502
```

Threads elementwise over lists:

```
>>> (1 / [9 7 5]).takagiFunction
[8/21 22/49 8/15]
```

Plot the Takagi function:

~~~spl svg=A
(-0.5 -- 1.5).functionPlot(
	200,
	takagiFunction:/1
)
~~~

![](sw/spl/Help/Image/takagiFunction-A.svg)

* * *

See also: blancmangeCurve

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Blancmange_curve)

Further Reading: Takagi 1901
