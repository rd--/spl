# parseBase16

- _parseBase16(s)_

Answer the `ByteArray` encoded in Base16 at the string _s_.

```
>>> '0102030405060708090A0B0C0D0E0F'
>>> .parseBase16
ByteArray(1:15)
```

Decode a four item Base-16 string:

```
>>> '0F00F010'
>>> .parseBase16
ByteArray([15 0 240 16])
```

Decode a hexadecimal encoding of an Ascii encoding of a `String`:

```
>>> '737472696E67'
>>> .parseBase16
>>> .asciiString
'string'
```

Parse _(r,g,b)_ colour:

~~~spl svg=A
let b = 'FECB00'.parseBase16;
RgbColour(b.contents / 255, 1)
~~~

![](sw/spl/Help/Image/parseBase16-A.svg)

_Note_:
This is aliased with `base16Decode`.

* * *

See also: asHexString, base16Decode, base16Encode, parseBase64

Guides: Parsing Functions

Categories: Converting
