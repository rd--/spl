# luvToXyz

- _luvToXyz(luv)_
- _luvToXyz(luv, whiteReference)_

Convert from Cie _L*u*v*_ colourspace to _Cie Xyz_ tristimulus values.

Specific values:

```
>>> [41.5288 96.8363 17.7521]
>>> .luvToXyz
[0.206549 0.121978 0.051351]
```

The inverse is `xyzToLuv`:

```
>>> [0.206549 0.121978 0.051351]
>>> .xyzToLuv
[41.5288 96.8363 17.7521]
```

* * *

See also: Colour, labToXyz, xyzToLuv

References:
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.Luv_to_XYZ.html)
