# realImaginary

- _realImaginary(n)_

Answer the `real` and `imaginary` parts of the number _n_.

At `Complex`:

```
>>> 1J2.realImaginary
[1 2]
```

Threads over lists:

```
>>> (-1, -2 .. -5).sqrt.realImaginary
[0 # 5, 1:5.sqrt].transposed
```

At `SmallFloat` and `LargeInteger` and `Fraction`:

```
>>> [3.141 23L 5/7].realImaginary
[3.141 0; 23L 0; 5/7 0]
```

* * *

See also: Complex, i, real, imaginary

Guides: Complex Numbers

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ReIm.html)

Categories: Math, Accessing
