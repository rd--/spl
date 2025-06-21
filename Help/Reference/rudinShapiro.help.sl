# rudinShapiro

- _rudinShapiro(n)_

Answer the _n_-th term in the Rudin–Shapiro sequence.

The sixth element of the Rudin–Shapiro sequence:

```
>>> 6.rudinShapiro
-1
```

The number 6 has an odd number of 11 sequences in its binary form:

```
>>> 6.integerDigits(2)
[1 1 0]
```

The first ten elements of the sequence:

```
>>> 0:9.collect(rudinShapiro:/1)
[1 1 1 -1 1 1 -1 1 1 1]
```

Threads over lists:

```
>>> [3 5 8 11].rudinShapiro
[-1 1 1 -1]
```

Generate a Rudin–Shapiro curve:

~~~spl svg=A
(
	0:500.collect { :n |
		let a = n.rudinShapiro;
		let b = (n + 1).rudinShapiro;
		-1 ^ ((1 + (a * b)) / 2)
	} * 0.5.pi
).anglePath.Line
~~~

![](sw/spl/Help/Image/rudinShapiro-A.svg)

Generate a path based on the Rudin–Shapiro sequence:

~~~spl svg=B
(1:512.rudinShapiro * 2/5.pi)
.anglePath
.Line
~~~

![](sw/spl/Help/Image/rudinShapiro-B.svg)

* * *

See also: thueMorse, integerDigits, substitutionSystem

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Rudin-ShapiroSequence.html)
[2](https://reference.wolfram.com/language/ref/RudinShapiro.html),
_OEIS_
[1](http://oeis.org/A020985),
_W_
[1](https://en.wikipedia.org/wiki/Rudin%E2%80%93Shapiro_sequence)
