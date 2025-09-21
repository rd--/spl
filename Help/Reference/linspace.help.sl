# linspace

- _linspace(x1, x2, n)_

Answer _n_ points, the spacing between the points is _(x2-x1)/(n-1)_.
For real values equivalent to `discretize`.

At `SmallFloat`, create a `List` of seven evenly spaced points in the interval -5 -- 5:

```
>>> -5.linspace(5, 7)
[-5 -10/3 -5/3 0 5/3 10/3 5]

>>> (-5 -- 5).discretize(7).asList
[-15 -10 -5 0 5 10 15] / 3
```

At `Complex`, create a `List` of eight evenly spaced points in the interval 1J2 -- 10J10:

```
>>> 1J2.linspace(10J10, 8)
[
	1.0000J2.0000
	2.2857J3.1429
	3.5714J4.2857
	4.8571J5.4286
	6.1429J6.5714
	7.4286J7.7143
	8.7143J8.8571
	10.000J10.000
]
```

* * *

See also: discretize, logspace, subdivide

Guides: Interpolation Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/linspace.html)
