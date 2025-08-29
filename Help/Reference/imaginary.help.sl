# imaginary

- _imaginary(x)_

Answer the imaginary part of the number _x_.

At `Complex`:

```
>>> 1J2.imaginary
2
```

Threads over lists:

```
>>> (-1 .. -5).sqrt.imaginary
1:5.sqrt
```

At `SmallFloat` and `LargeInteger` and `Fraction`:

```
>>> [3.141 23L 5/7].imaginary
[0 0 0]
```

C.f. `i`:

```
>>> 3.i
0J3
```

* * *

See also: Complex, i, real, realImaginary

Guides: Complex Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Im.html)

Categories: Accessing, Complex, Math
