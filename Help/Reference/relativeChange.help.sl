# relativeChange

- _relativeChange(x, y, f:/2)_

Answer the relative change from _x_ to _y_ given scale function _f_.
If _f_ is elided answer the _classical_ relative change,
i.e. _f(x,y)=x_.

Classical relative change:

```
>>> 90.relativeChange(100) { :x :y | x }
1/9

>>> 90.relativeChange(100)
1/9

>>> 1/9 * 100
11.1111

>>> 100.relativeChange(110) { :x :y | x }
1/10

>>> 100.relativeChange(110)
1/10

>>> 1/10 * 100
10.0000

>>> 100.relativeChange(90) { :x :y | x }
-1/10

>>> 100.relativeChange(90)
-1/10

>>> 110.relativeChange(100) { :x :y | x }
-1/11

>>> 110.relativeChange(100)
-1/11
```

Reversed relative change:

```
>>> 90.relativeChange(100) { :x :y | y }
1/10

>>> 1/10 * 100
10.0000

>>> 100.relativeChange(110) { :x :y | y }
1/11

>>> 1/11 * 100
9.0909
```

Arithmetic mean change:

```
>>> 90.relativeChange(100) { :x :y |
>>> 	(x + y) / 2
>>> }
2/19

>>> 2/19 * 100
10.5263

>>> 100.relativeChange(110) { :x :y |
>>> 	(x + y) / 2
>>> }
2/21

>>> 2/21 * 100
9.5238
```

Geometric mean change:

```
>>> 90.relativeChange(100) { :x :y |
>>> 	(x * y).sqrt
>>> }
0.10541

>>> 100.relativeChange(110) { :x :y |
>>> 	(x * y).sqrt
>>> }
0.09535
```

Harmonic mean change:

```
>>> 90.relativeChange(100) { :x :y |
>>> 	2 / ((1 / x) + (1 / y))
>>> }
19/180

>>> 19/180 * 100
10.5555

>>> 100.relativeChange(110) { :x :y |
>>> 	2 / ((1 / x) + (1 / y))
>>> }
21/220

>>> 21/220 * 100
9.5454
```

Moment mean change of order _k_:

```
>>> let k = 2;
>>> 90.relativeChange(100) { :x :y |
>>> 	let a = (x ^ k) + (y ^ k);
>>> 	(a / 2).abs ^ (1 / k)
>>> }
0.10512

>>> let k = 2;
>>> 100.relativeChange(110) { :x :y |
>>> 	let a = (x ^ k) + (y ^ k);
>>> 	(a / 2).abs ^ (1 / k)
>>> }
0.09513
```

Maximum mean change:

```
>>> 90.relativeChange(100, max:/2)
1/10

>>> 100.relativeChange(110, max:/2)
1/11
```

Minimum mean change:

```
>>> 90.relativeChange(100, min:/2)
1/9

>>> 100.relativeChange(110, min:/2)
1/10
```

Logarithmic mean change:

```
>>> 90.relativeChange(100) { :x :y |
>>> 	(y - x) / (y / x).log
>>> }
0.10536

>>> 90.logarithmicChange(100)
0.10536

>>> 100.relativeChange(110) { :x :y |
>>> 	(y - x) / (y / x).log
>>> }
0.09531

>>> 100.logarithmicChange(110)
0.09531
```

* * *

See also: log, logarithmicChange, subtract

Guides: Statistics Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Relative_change)

Further Reading: Tornqvist 1985
