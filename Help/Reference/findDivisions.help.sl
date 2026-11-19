# findDivisions

- _findDivisions(i--j, n)_
- _findDivisions(i--j, m, n)_

Answer a list of about _n_ "nice" numbers that divide the interval around _i--j_ into equally spaced parts.
In the ternary case, find divisions that are aligned to multiples of _m_.

Find five divisions of the interval _(0, 1)_:

```
>>> (0/1 -- 1/1).findDivisions(5L)
>>> .List
[0/1 1/5 2/5 3/5 4/5 1/1]

>>> (0.0 -- 1.0).findDivisions(5L)
>>> .List
[0.0 0.2 0.4 0.6 0.8 1.0]
```

Find five divisions of the interval _(7, 95)_:

```
>>> (7.0 -- 95.0).findDivisions(5L)
>>> .List
[0 20 40 60 80 100]
```

Find eleven divisions of the interval _(1, 99)_:

```
>>> (1.0 -- 99.0).findDivisions(11L)
Range(0.0, 100.0, 10.0, 11L)
```

Multiples of ten,
OEIS [A008592](https://oeis.org/A008592):

```
>>> (7.0 -- 93.0).findDivisions(10).List
[0 10 20 30 40 50 60 70 80 90 100]

>>> 0:10 * 10
[0 10 20 30 40 50 60 70 80 90 100]
```

Division endpoints may be outside the initial range:

```
>>> (1/10 -- 9/10).findDivisions(5L)
>>> .List
[0/1 1/5 2/5 3/5 4/5 1/1]

>>> (0.1 -- 0.9).findDivisions(5)
>>> .List
[0.0 0.2 0.4 0.6 0.8 1.0]
```

Find divisions that are aligned to multiples of `pi`:

```
>>> (0.0 -- 10.0).findDivisions(1.pi, 5L)
[0.0 3.14159 6.28318 9.42478 12.56637]
```

* * *

See also: histogramList, subdivide

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindDivisions.html)
