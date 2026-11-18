# mantissaExponent

- _mantissaExponent(x, b=10)_

Answer the base-_b_ mantissa and exponent of _x_.

At `Float`:

```
>>> (3.4 * 1.0E13).mantissaExponent(10)
[0.34 14]

>>> 456.1414.mantissaExponent(10)
[0.4561414 3]
```

At a small integer:

```
>>> 123451.0.mantissaExponent(10)
[0.123451 6L]
```

Base two:

```
>>> 1027.0.mantissaExponent(2)
[1027.0 / 2048.0, 11L]
```

* * *

See also: fractionExponent, realDigits

Guides: Floating Point Functions, Number Digit Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MantissaExponent.html)
