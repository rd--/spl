# i

- _i(x)_

Answer a `Complex` number with a real part of `zero` and an imaginary part of _x_.
`i` is the imaginary unit, defined as the square root of negative one.

```
>>> 1.i
0J1

>>> -1.sqrt
1.i

>>> 3 + 1.i
3J1
```

At `Complex`:

```
>>> 2J3.i
-3J2
```

Threads over lists:

```
>>> [3 -4 6].i
[0J3 0J-4 0J6]
```

Function defined multiplicatively on the complex numbers,
OEIS [A076340](https://oeis.org/A076340) and
OEIS [A076341](https://oeis.org/A076341):

~~~spl svg=A
2:115.collect { :n |
	n.factorInteger.product { :f |
		let [p, e] = f;
		(p = 2).if {
			2
		} {
			let a = (p / 4).floor;
			let b = (p % 4 / 2).floor;
			let c = (2 - (p % 4)).i;
			(a + b) * 4 + c
		} ^ e
	}
}.realImaginary.transpose.scatterPlot
~~~

![](Help/Image/i-A.svg)

* * *

See also: Complex, imaginary, j, real

Guides: Complex Number Functions, Mathematical Constants

References:
_Apl_
[1](https://aplwiki.com/wiki/Imaginary),
_Mathematica_
[1](https://mathworld.wolfram.com/i.html)
[2](https://mathworld.wolfram.com/ImaginaryUnit.html),
_W_
[1](https://en.wikipedia.org/wiki/Imaginary_unit)

Categories: Converting
