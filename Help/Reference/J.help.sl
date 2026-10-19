# J

- J(r, i)_

Answer a `Complex` number with a real part of _r_ and an imaginary part of _i_.
`J` is an alias for `Complex`.
`J` mirrors the literal syntax for complex numbers.

```
>>> (1 + -2I) + (3 + 4I)
4 + 2I

>>> 1.J(-2) + 3.J(4)
4J2

>>> 1J-2 + 3J4
4J2
```

Threads over lists:

```
>>> [-2 9 5].J([3 -4 6])
[-2J3 9J-4 5J6]
```

Number of Gaussian integers _x+yi_ having absolute value _n_,
OEIS [A046109](https://oeis.org/A046109):

~~~spl svg=A oeis=A046109
(0 .. 47).collect { :n |
	let r = (-n .. n);
	J/2.table(r, r)
	.catenate
	.select { :x |
		x.abs = n
	}.size
}.stepPlot
~~~

![](Help/Image/J-A.svg)

* * *

See also: Complex, I, imaginary, real

Guides: Complex Number Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Complex_(function)),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/jdot#dyadic)
[2](https://www.jsoftware.com/help/dictionary/djdot.htm)

Categories: Math, Number
