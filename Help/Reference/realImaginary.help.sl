# realImaginary

- _realImaginary(aNumber)_

Answer the real and imaginary part of _aNumber_.

At `Complex`:

```
>>> 1j2.realImaginary
[1 2]
```

Threads over lists:

```
>>> -1:-5.sqrt.realImaginary
[0 # 5, 1:5.sqrt].transposed
```

At `SmallFloat` and `LargeInteger` and `Fraction`:

```
>>> [3.141 23n 5/7].realImaginary
[3.141 0; 23n 0; 5/7 0]
```

* * *

See also: Complex, i, real, imaginary

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ReIm.html)

Categories: Math, Accessing
