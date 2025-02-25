# discretize

- _discretize(anInterval, anInteger)_
- _discretize(alpha, beta, gamma)_ ⟹ _discretize(alpha, beta).collect(gamma)_

Answer a `Range` of _anInteger_ places having a linear interpolation of _anInterval_.

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
.discretize(99)
.exp
.linePlot
~~~

![](sw/spl/Help/Image/discretize-A.svg)

Plot `hannFunction`:

~~~spl svg=B
(-0.5 -- 0.5)
.discretize(99)
.collect(hannWindow:/1)
.linePlot
~~~

![](sw/spl/Help/Image/discretize-B.svg)

Sample a function uniformly on an interval:

~~~spl svg=C
(0 -- 2.pi)
.discretize(48)
.collect { :i |
	(2 * i).sin - (3 * i).cos
}
.discretePlot
~~~

![](sw/spl/Help/Image/discretize-C.svg)

* * *

See also: --, Interval, Range, subdivide
