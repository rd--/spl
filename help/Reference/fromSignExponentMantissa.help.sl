# fromSignExponentMantissa

- _fromSignExponentMantissa(aList)_

Answer a `SmallFloat` reconstructed from the components of the Ieee 754 floating point representation.
The components are, in sequence, _sign_, _exponent_ and _mantissa_.
The reconstruction is _(-1 ^ sign) * (2 ^ exponent) * mantissa_.

```
>>> [0 -4 1.968].fromSignExponentMantissa
0.123

>>> (-1 ^ 0) * (2 ^ -4) * 1.968
0.123
```

* * *

See also: signExponentMantissa, SmallFloat
