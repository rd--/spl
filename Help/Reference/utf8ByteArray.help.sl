# utf8ByteArray

- _utf8ByteArray(s)_

Answer a `ByteArray` of the Utf-8 encoding of the string _s_.
Alias for `ByteArray` at `String`.

```
>>> ByteArray'€'
ByteArray[226 130 172]

>>> ByteArray'aAα'
ByteArray[97 65 206 177]

>>> ByteArray'abcABCΑΒΓαβγ'
ByteArray[
	97 98 99
	65 66 67
	206 145 206 146 206 147
	206 177 206 178 206 179
]
```

`utf8String`,
aliased to `String` at `ByteArray`,
is the inverse of `utf8ByteArray`:

```
>>> ByteArray[226 130 172]
>>> .String
'€'

>>> let n = 8750;
>>> let s = n.fromCodePoint;
>>> let b = s.utf8ByteArray;
>>> (b, b.utf8String)
(ByteArray[226 136 174], '∮')
```

Plot Utf-8 code points of a String:

~~~spl svg=A
ByteArray'utf8ByteArray'
.List
.discretePlot
~~~

![](Help/Image/utf8ByteArray-A.svg)

* * *

See also: ByteArray, String, asciiByteArray, utf16List, utf8String

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToCharacterCode.html)
[2](https://reference.wolfram.com/language/ref/StringToByteArray.html)

Categories: String, Encoding
