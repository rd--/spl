# rescale

- _rescale(x, [⌊ ⌈], [y⌊ y⌈]=[0 1])_

In the ternary case,
answer _x_ rescaled to run from _y⌊_ to _y⌈_ over the range _⌊_ to _⌈_.
In the binary case _y⌊_ and _y⌈_ are set to `zero` and `one`.
In the unary case _⌊_ and _⌈_ are set to the (deep) ⌊ and ⌈ of the collection _x_.

At `SmallFloat`:

```
>>> 2.5.rescale([-10 10])
0.625

>>> 2.5.rescale([-10 10], [0 1])
0.625

>>> 12.5.rescale([-10 10])
1.125

>>> 12.5.rescale([-10 10], [0 1])
1.125
```

At `Fraction`:

```
>>> -3/2.rescale([-2 2])
1/8
```

At `SmallFloat`:

```
>>> 1.pi.rescale([0 2.5])
1.25664

>>> 3.rescale([-9 7], [11 28])
(95 / 4)

>>> (1 / 11).rescale([1/7 5])
-0.010695

>>> 8.rescale([-9 7.11111])
1.05517
```

At `List`:

```
>>> [-10 0 10].rescale([-10 10])
[0 0.5 1]

>>> [-10 0 10].rescale([-10 10])
[0 0.5 1]
```

Rescale so that all the `List` elements run from 0 to 1:

```
>>> [-0.7 0.5 1.2 5.6 1.8].rescale
[0 0.19048 0.30159 1 0.39683]

>>> [-2 0 2].rescale
[0 0.5 1]

>>> 1:5.rescale
[0 0.25 0.5 0.75 1]
```

Specify the maximum and minimum values:

```
>>> [-2 0 2].rescale([-5 5], [0 1])
[0.3 0.5 0.7]

>>> [-2 0 2].rescale([-5 5], [-1 1])
[-2/5 0 2/5]

>>> 1:5.rescale([1 5], [-1 1])
[-1 -0.5 0 0.5 1]
```

Make a Celsius-to-Fahrenheit conversion table:

```
>>> let c = [-40, -30 .. 80];
>>> let f = c.rescale([-40 100], [-40 212]);
>>> [c f].transpose
[
	-40 -40;
	-30 -22;
	-20  -4;
	-10  14;
	  0  32;
	 10  50;
	 20  68;
	 30  86;
	 40 104;
	 50 122;
	 60 140;
	 70 158;
	 80 176
]
```

Linear rescaling from _0,1_ to _3,9_:

```
>>> [0 0.5 1].rescale([0 1], [3 9])
[3 6 9]
```

At a 3×3 matrix:

```
>>> [3 3].iota.rescale([1 9], [-1 1])
[
	-1.00 -0.75 -0.50;
	-0.25 +0.00 +0.25;
	+0.50 +0.75 +1.00
]
```

In the array case the minima and maxima are _deep_,
so that the answer retains the same shape as the input:

```
>>> [3 3].iota.rescale
[
	0.000 0.125 0.250;
	0.375 0.500 0.625;
	0.750 0.875 1.000
]

>>> let m = [3 3].iota;
>>> m.rescale(m.min, m.max, 0, 1).shape
[3 3 3]
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot([
	identity:/1,
	{ :each | each.round },
	{ :each | each.rescale([-2 2]) }
])
~~~

![](sw/spl/Help/Image/rescale-A.svg)

* * *

See also: clip, linLin, mean, normalize, scaled

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rescale.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/rescale.html)
