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

~~~
(0 -- 5).functionPlot(exp:/1)
~~~

Plot `hannFunction`:

~~~
(-0.5 -- 0.5).functionPlot(hannWindow:/1)
~~~

* * *

See also: --, Interval, Range, subdivide
