# dmsString

- _dmsString(θ)_
- _dmsString([d m s])_

Answer a degrees-minutes-seconds string representing the angle θ, given in decimal degrees.

```
>>> 20.53773.dmsString
'20°32′15.828″'
```

Canonicalize a Dms list:

```
>>> [11 -30 5].dmsString
'10°30′5.000″'
```

* * *

See also: degree, dmsList, fromDms, GeodeticCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DMSString.html)

Unicode: U+2032 ′ Prime, U+2033 ″ Double Prime
