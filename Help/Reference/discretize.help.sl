# discretize

- _discretize(i—j, n)_
- _discretize(i—j, n, f:/1)_

Answer a `Range` of _n_ places having a linear interpolation of the `Interval` _(i,j)_.

```
>>> (-0.5 -- 0.5).discretize(3)
(-0.5, 0 .. 0.5)

>>> (-0.5 -- 0.5).discretize(5)
(-0.5, -0.25 .. 0.5)

>>> (-0.5 -- 0.5).discretize(9)
(-0.5, -0.375 .. 0.5)
```

In the ternary form apply _aBlock_ to each element during construction.

```
>>> (0 -- 1).discretize(3, exp:/1)
[1 1.648721 2.718282]
```

Plot `exp` function from `zero` to `five`:

~~~spl svg=A
(0 -- 5)
.discretize(99, exp:/1)
.linePlot
~~~

![](sw/spl/Help/Image/discretize-A.svg)

Plot `hannFunction`:

~~~spl svg=B
(-0.5 -- 0.5)
.discretize(99, hannWindow:/1)
.linePlot
~~~

![](sw/spl/Help/Image/discretize-B.svg)

Sample a function uniformly on an interval:

~~~spl svg=C
(0 -- 2.pi)
.discretize(48) { :i |
	(2 * i).sin - (3 * i).cos
}
.discretePlot
~~~

![](sw/spl/Help/Image/discretize-C.svg)

Plot the sine function:

~~~spl svg=D
(0 -- 4.pi).discretize(100, sin:/1).linePlot
~~~

![](sw/spl/Help/Image/discretize-D.svg)

* * *

See also: --, Interval, Range, subdivide

Guides: Coordinate System Functions, Interpolation Functions, List Functions
