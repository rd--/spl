# rescale

- _rescale(aNumber | aCollection, min, max, yMin, yMax)_
- _rescale(alpha, beta, gamma)_ ⟹ _rescale(alpha, beta, gamma, 0, 1)_
- _rescale(alpha)_ ⟹ _rescale(alpha, alpha.deepMin, alpha.deepMax, 0, 1)_

In the quinternary case,
answer _aNumber_ rescaled to run from _yMin_ to _yMax_ over the range _min_ to _max_.
In the ternary case _yMin_ and _yMax_ are set to `zero` and `one`.
In the unary case _min_ and _max_ are set to the (deep) minima and maxima of _aCollection_.

```
>>> 2.5.rescale(-10, 10, 0, 1)
0.625

>>> 12.5.rescale(-10, 10, 0, 1)
1.125

>>> [-10 0 10].rescale(-10, 10, 0, 1)
[0 0.5 1]
```

At `Fraction`:

```
>>> -3/2.rescale(-2, 2, 0, 1)
1/8
```

At `SmallFloat`:

```
>>> 1.pi.rescale(0, 2.5, 0, 1)
1.25664

>>> 3.rescale(-9, 7, 11, 28)
(95 / 4)

>>> (1 / 11).rescale(1 / 7, 5, 0, 1)
-0.010695

>>> 8.rescale(-9, 7.11111, 0, 1)
1.05517
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
>>> [-2 0 2].rescale(-5, 5, 0, 1)
[0.3 0.5 0.7]

>>> [-2 0 2].rescale(-5, 5, -1, 1)
[-2 / 5, 0, 2 / 5]

>>> 1:5.rescale(1, 5, -1, 1)
[-1 -0.5 0 0.5 1]
```

Make a Celsius-to-Fahrenheit conversion table:

```
>>> (-40, -30 .. 80).collect { :each |
>>> 	[each, each.rescale(-40, 100, -40, 212)]
>>> }
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

Linear rescaling from (0, 1) to (3, 9):

```
>>> [0 0.5 1].collect { :each |
>>> 	each.rescale(0, 1, 3, 9)
>>> }
[3 6 9]
```

At a 3×3 matrix:

```
>>> [3 3].iota.rescale(1, 9, -1, 1)
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
(-3 -- 3).functionPlot { :each |
	each.rescale(-2, 2)
}
~~~

![](sw/spl/Help/Image/rescale-A.svg)

* * *

See also: clip, linLin, mean, normalize, scaled

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rescale.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/rescale.html)
