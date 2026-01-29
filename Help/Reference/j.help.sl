# j

- _j(r, i)_

Answer a `Complex` number with a real part of _r_ and an imaginary part of _i_.

```
>>> (1 + -2.i) + (3 + 4.i)
4 + 2.i

>>> 1.j(-2) + 3.j(4)
4.j(2)

>>> 1J-2 + 3J4
4J2
```

Threads over lists:

```
>>> [-2 9 5].j([3 -4 6])
[-2J3 9J-4 5J6]
```

Plot number of Gaussian integers _x+yi_ having absolute value _n_,
OEIS [A046109](https://oeis.org/A046109):

~~~spl svg=A
0:47.collect { :n |
	j:/2.table(-n:n, -n:n)
	.catenate
	.select { :x |
		x.abs = n
	}.size
}.stepPlot
~~~

![](sw/spl/Help/Image/j-A.svg)

* * *

See also: Complex, i, imaginary, real

Guides: Complex Number Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Complex_(function)),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/jdot#dyadic)

Categories: Math, Number
