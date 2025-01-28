# subdivide

- _subdivide(anInteger)_
- _subdivide(anInterval, anInteger)_

Answer the `Range` that subdivides either _(0 -- 1)_ or _anInterval_ into _anInteger_ parts,
therefore having size _anInteger + 1_.

Subdivide the unit interval into 10 equal parts:

```
>>> 10.subdivide
Range(0, 1, 1/10)

>>> 10.subdivide.asList
[
	0/1 1/10 1/5 3/10 2/5
	1/2 3/5 7/10 4/5 9/10
	1/1
]
```

Subdivide the interval `zero` to `one` into 100 equal parts:

```
>>> (0 -- 1).subdivide(100)
(0, 0.01 .. 1)
```

Subdivide the interval 0 to 10 into 5 equal parts:

```
>>> (0 -- 10).subdivide(5)
(0, 2 .. 10)
```

Subdivide the interval -1 to 1 into 8 equal parts:

```
>>> (-1 -- 1).subdivide(8)
(-1, -0.75 .. 1)
```

Subdivide the interval from `e` to `pi`:

```
>>> (1.e -- 1.pi).subdivide(4).asList
[2.7183 2.8241 2.9299 3.0358 3.1416]
```

Compare `subdivide` and `Range Syntax`:

```
>>> (3 -- 11).subdivide(4)
(3, 5 .. 11)

>>> [3, 5 .. 11]
[3 5 7 9 11]

>>> (-1 -- 2).subdivide(5)
(-1, -0.4 .. 2)

>>> [-1, -0.4 .. 2]
[-1 -0.4 0.2 0.8 1.4 2]
```

Compare `subdivide` and `discretize`:

```
>>> (1 -- 10).subdivide(9)
1:10

>>> (1 -- 10).discretize(10)
1:10
```

The last value is treated especially to avoid range errors:

```
>>> let l = (1 -- 5).subdivide(100).asList;
>>> (l[100] > 4.96, l[101] > 5)
(true, false)
```

* * *

See also: --, discretize, Interval, Range

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Subdivide.html)

Categories: Math, Vector
