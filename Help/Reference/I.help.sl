# I

- _I(x)_

Answer a `Complex` number with a real part of `zero` and an imaginary part of _x_.
`I` is the imaginary unit, defined as the square root of negative one.
`I` mirrors the literal syntax.

```
>>> 1I
0J1

>>> 1.I
0J1

>>> -1.sqrt
1.I

>>> 3 + 1.I
3J1
```

At `Complex`:

```
>>> 2J3.i
-3J2
```

Threads over lists:

```
>>> I[3 -4 6]
[0J3 0J-4 0J6]
```

Function defined multiplicatively on the complex numbers,
OEIS [A076340](https://oeis.org/A076340) and
OEIS [A076341](https://oeis.org/A076341):

~~~spl svg=A oeis=A076340
2:115.collect { :n |
	n.factorInteger.product { :f |
		let [p, e] = f;
		(p = 2).if {
			2
		} {
			let a = (p / 4).floor;
			let b = (p % 4 / 2).floor;
			let c = (2 - (p % 4)).I;
			(a + b) * 4 + c
		} ^ e
	}
}.realImaginary.transpose.scatterPlot
~~~

![](Help/Image/I-A.svg)

A Cornu spiral
(Coutsias and Kazarinoff 1987):

~~~spl svg=B
let k = 127;
let n = (0 .. k * 2);
(n.square * 1I.pi / k)
.exp
.prefixSum
.realImaginary
.PointCloud
~~~

![](Help/Image/I-B.svg)

A periodic lattice of simple Cornu spirals
(Coutsias and Kazarinoff 1987):

~~~spl svg=C
let k = 149;
let n = (0 .. k * 2);
(n.square * 4I.pi / k)
.exp
.prefixSum
.realImaginary
.PointCloud
~~~

![](Help/Image/I-C.svg)

* * *

See also: Complex, J, i, imaginary, real

Guides: Complex Number Functions, Mathematical Constants

References:
_Apl_
[1](https://aplwiki.com/wiki/Imaginary),
_J_
[1](https://www.jsoftware.com/help/dictionary/djdot.htm),
_Mathematica_
[1](https://mathworld.wolfram.com/i.html)
[2](https://mathworld.wolfram.com/ImaginaryUnit.html),
_W_
[1](https://en.wikipedia.org/wiki/Imaginary_unit)

Categories: Converting
