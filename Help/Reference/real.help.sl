# real

- _real(n)_

Answer the real part of the number _n_.

At `Complex`:

```
>>> 1J2.real
1

>>> (1 + 3.i).real
1
```

At `Quaternion`:

```
>>> Quaternion([1 2 3 4]).real
1
```

Threads over lists:

```
>>> (-1, -2 .. -5).sqrt.real
[0 0 0 0 0]
```

At `SmallFloat` and `LargeInteger` and `Fraction`:

```
>>> [3.141 23L 5/7].real
[3.141 23L 5/7]
```

* * *

See also: Complex, imaginary, real, realImaginary

Guides: Complex Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Re.html)

Categories: Accessing, Complex, Math
