# mantissaExponent

- _mantissaExponent(x, b=10)_

Answer the base-_b_ mantissa and exponent of _x_.

At `SmallFloat`:

```
>>> (3.4 * 1E30).mantissaExponent(10)
[0.34 31]

>>> 456.1414.mantissaExponent(10)
[0.4561414 3]
```

At a small integer:

```
>>> 123451.mantissaExponent(10)
[123451/1000000 6]
```

Base two:

```
>>> 1027.mantissaExponent(2)
[1027/2048 11]
```

* * *

See also: realDigits

Guides: Number Digit Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MantissaExponent.html)
