# takagiFunction

- _takagiFunction(x, n=100)_

Implement the Takagi function,
a self-affine function that is continuous and nowhere differentiable.

Specific values:

```
>>> 2.0.takagiFunction(5)
0.0

>>> 12/19.takagiFunction(15)
50465/77824

>>> Float(12/19)
>>> .takagiFunction(15)
0.64845

>>> 1.273.takagiFunction(19)
0.58656
```

Threads elementwise over lists:

```
>>> (1L / [9L 7L 5L]).takagiFunction(15)
[4681/12288 51491/114688 43689/81920]

>>> (1.0 / [9.0 7.0 5.0]).takagiFunction(15)
[0.38094 0.44897 0.53331]
```

Plot the Takagi function:

~~~spl svg=A
(-0.5 -- 1.5)
.functionPlot(200) { :x |
	x.takagiFunction(15)
}
~~~

![](Help/Image/takagiFunction-A.svg)

* * *

See also: blancmangeCurve

Guides: Curve Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Blancmange_curve)

Further Reading: Takagi 1901
