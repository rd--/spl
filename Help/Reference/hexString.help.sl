# hexString

- _hexString(aColour)_

Answer the number sign prefixed two character per byte hexadecimal notation string of the receiver.

At `Colour` answer the _Rgb_ hexadecimal string of _aColour_:

```
>>> RgbColour([0.2 0.5 0.7], 1).hexString
'#3380B3'

>>> HsvColour([0.5 0.25 0.85], 1).hexString
'#A3D9D9'
```

_Rationale_:
This is distinct from `asHexString`,
which does not includes the leading number sign.

* * *

See also: asHexString, Colour, parseHexString, printString, RgbColour
