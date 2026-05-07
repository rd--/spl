# discretize

- _discretize(i—j, n)_
- _discretize(i—j, n, f:/1)_

Answer a sequence of _n_ places having a linear interpolation of the `Interval` _(i,j)_.

Odd _n_:

```
>>> (-0.5 -- 0.5).discretize(3).asList
[-0.5 0 0.5]

>>> (-0.5 -- 0.5).discretize(5).asList
[-0.5 -0.25 0 0.25 0.5]

>>> (-0.5 -- 0.5).discretize(9).asList
[
	-0.5  -0.375 -0.25 -0.125
	 0
	 0.125 0.25   0.375 0.5
]
```

Cannot discretize to one place:

```
>>> { (0 -- 1).discretize(1) }.hasError
true
```

Even _n_:

```
>>> (0 -- 7).discretize(8).asList
[0 1 2 3 4 5 6 7]

>>> (0 -- 14).discretize(8).asList
[0 2 4 6 8 10 12 14]

>>> (0 -- 6).discretize(4).asList
[0 2 4 6]
```

Note that the answer is strictly of the requested size,
unlike a `Range` value that may,
due to precision errors,
have an unexpected size:

```
>>> (0 -- 1).discretize(100)
Range(0, 1, 1 / 99, 100)

>>> Range(0, 1, 1 / 99)
Range(0, 1, 1 / 99, 99)

>>> (-1 -- 1).discretize(100)
Range(-1, 1, 2 / 99, 100)

>>> Range(-1, 1, 2 / 99)
Range(-1, 1, 2 / 99, 99)

>>> (0 -- 4).discretize(100)
Range(0, 4, 4 / 99, 100)

>>> Range(0, 4, 4 / 99)
Range(0, 4, 4 / 99, 99)
```

In the ternary form apply the unary block _f_ to each element during construction.

```
>>> (0 -- 1).discretize(3, exp:/1)
[1 1.648721 2.718282]

>>> (0 -- 6).discretize(4, square:/1)
[0 4 16 36]
```

Plot `exp` function from `zero` to `five`:

~~~spl svg=A
(0 -- 5)
.discretize(99, exp:/1)
.linePlot
~~~

![](Help/Image/discretize-A.svg)

Plot `hannFunction`:

~~~spl svg=B
(-0.5 -- 0.5)
.discretize(99, hannWindow:/1)
.linePlot
~~~

![](Help/Image/discretize-B.svg)

Sample a function uniformly on an interval:

~~~spl svg=C
(0 -- 2.pi)
.discretize(48) { :i |
	(2 * i).sin - (3 * i).cos
}.discretePlot
~~~

![](Help/Image/discretize-C.svg)

Plot the sine function:

~~~spl svg=D
(0 -- 4.pi).discretize(100, sin:/1).linePlot
~~~

![](Help/Image/discretize-D.svg)

Plot half phase-space orbits for the Kepler problem:

~~~spl svg=E
let l = 0.6;
let endPoints = { :e |
	let a = 2 * e * l.square;
	let b = (1 + a).sqrt;
	let c = 2 * e;
	let p = (-1 + b) / c;
	let q = (-1 - b) / c;
	p -- q
};
let p = { :r :e |
	let a = l.square / 2 / r.square;
	let b = 1 / r;
	let c = (e - a + b).max(0);
	2 * c.sqrt
};
[-0.5 -0.75 -1 -1.25].collect { :e |
	e.endPoints.discretize(150) { :r |
		[r, p(r, e)]
	}
}.linePlot
~~~

![](Help/Image/discretize-E.svg)

* * *

See also: --, Interval, Range, subdivide

Guides: Coordinate System Functions, Interpolation Functions, List Functions
