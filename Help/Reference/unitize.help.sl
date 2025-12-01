# unitize

- _unitize(x)_
- _unitize(x, dx)_

Answer `zero` when _x_ is `zero`, and `one` when _x_ has any other numerical value.
In the binary case, answer `zero` for any _x_ with magnitude less than _dx_.

Convert numerical values to zero or one:

```
>>> 1.pi.unitize
1
```

With `epsilon`:

```
>>> let a = 5 + (2 * 6.sqrt);
>>> let b = 2.sqrt + 3.sqrt - a.sqrt;
>>> (b, b.unitize(1.epsilon))
(4E-16, 0)
```

Replace values in a matrix with zeroes or ones:

```
>>> [-2 1 0 1; 1 -2 1 0; 0 1 -2 1; 1 0 -2 1]
>>> .unitize
[
	1 1 0 1;
	1 1 1 0;
	0 1 1 1;
	1 0 1 1
]
```

Plot matrix:

~~~spl svg=A
[-2 1 0 1; 1 -2 1 0; 0 1 -2 1; 1 0 -2 1]
.matrixPlot
~~~

![](sw/spl/Help/Image/unitize-A.svg)

Plot unitized matrix:

~~~spl svg=B
[-2 1 0 1; 1 -2 1 0; 0 1 -2 1; 1 0 -2 1]
.unitize
.matrixPlot
~~~

![](sw/spl/Help/Image/unitize-B.svg)

* * *

See also: boole, clip, diracDelta, kroneckerDelta, sign, unitStep

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Unitize.html)
