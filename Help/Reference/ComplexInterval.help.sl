# ComplexInterval

- _ComplexInterval(a, b)_

`ComplexInterval` is a type representing a rectangular area of the complex plane.
The are is bounded by _a_ at the lower-left and _b_ at the upper right.
Complex intervals are closed, they includes both end points.

```
>>> let i = ComplexInterval(-1J-1, 1J1);
>>> (
>>> 	i.lowerLeft,
>>> 	i.upperRight,
>>> 	i.endPoints,
>>> 	i.includes(0J0),
>>> 	i.includes(1J1)
>>> )
(-1J-1, 1J1, [-1J-1, 1J1], true, true)
```

Use `includes` to determine if a point is in the interval (checking for containment):

```
>>> (2J2 -- 5J5)
>>> .includes(3J3)
true

>>> let i = (1J1 -- 5J5);
>>> [3J2, 5J1, 1J4, 9J0].collect { :each |
>>> 	i.includes(each)
>>> }
[true true true false]
```

It is an `error` if _a_ does not precede _b_:

```
>>> {
>>> 	(1J1 -- 0J0)
>>> }.hasError
true
```

`ComplexInterval` values can be converted to complex matrices using `discretize`,
the grid is given a two-element list,
indicating the number of divisions of the imaginary (y) and the real (x) components:

```
>>> (0J0 -- 3J3)
>>> .discretize([4 4])
[
	0J0 1J0 2J0 3J0;
	0J1 1J1 2J1 3J1;
	0J2 1J2 2J2 3J2;
	0J3 1J3 2J3 3J3
]
```

or `subdivide`:

```
>>> (0J0 -- 3J3)
>>> .subdivide([3 3])
[
	0J0 1J0 2J0 3J0;
	0J1 1J1 2J1 3J1;
	0J2 1J2 2J2 3J2;
	0J3 1J3 2J3 3J3
]
```

The `center` of a complex interval:

```
>>> let x = 3J3 -- 7J7;
>>> (
>>> 	x.center,
>>> 	(3J3 + 7J7) / 2.0
>>> )
(5J5, 5J5)
```

Threads over lists:

```
>>> ComplexInterval([1J1 3J3 5J5], [4J4 5J5 6J6])
[1J1 -- 4J4, 3J3 -- 5J5, 5J5 -- 6J6]

>>> ComplexInterval([1J1 3J3 5J5], 7J7)
[1J1 -- 7J7, 3J3 -- 7J7, 5J5 -- 7J7]

>>> ComplexInterval(1J1, [3J3 5J5 7J7])
[1J1 -- 3J3, 1J1 -- 5J5, 1J1 -- 7J7]
```

Sample a function over a complex interval:

~~~spl svg=A
(-1J-1.pi -- 1J1.pi)
.subdivide([6 24])
.deepCollect { :z |
	(2 * z).sin - (3 * z).cos
}.arg.colourMatrixPlot
~~~

![](Help/Image/ComplexInterval-A.svg)

* * *

See also: Complex, Interval, --, discretize, includes, subdivide

Guides: Complex Number Functions, Interval Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Interval_(mathematics))
