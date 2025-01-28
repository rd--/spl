# hexString

- _hexString(aByteArray | aColour)_

Answer the two character per byte hexadecimal notation string of the receiver.

At `ByteArray`:

```
>>> 9:15.asByteArray.hexString
'090A0B0C0D0E0F'
```

At `ByteArray` of the Ascii encoding of a `String`:

```
>>> 'string'.asciiByteArray.hexString
'737472696E67'
```

At `Colour` answer _Rgb_ hexadecimal string of _aColour_:

```
>>> RgbColour([0.2 0.5 0.7], 1).hexString
'#3380B3'

>>> HsvColour([0.5 0.25 0.85], 1).hexString
'#A3D9D9'
```

* * *

See also: asHexString, Colour, parseHexString, printString, RgbColour
