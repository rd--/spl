# utf8ByteArray

- _utf8ByteArray(s)_

Answer a `ByteArray` of the Utf-8 encoding of the string _s_.

```
>>> '€'.utf8ByteArray
[226 130 172].asByteArray

>>> 'aAα'.utf8ByteArray
[97 65 206 177].asByteArray

>>> 'abcABCΑΒΓαβγ'.utf8ByteArray
[
	97 98 99
	65 66 67
	206 145 206 146 206 147
	206 177 206 178 206 179
].asByteArray
```

`utf8String` is the inverse of `utf8ByteArray`:

```
>>> let integer = 8750;
>>> let character = integer.asCharacter;
>>> let string = character.characterString;
>>> let byteArray = string.utf8ByteArray;
>>> (
>>> 	integer,
>>> 	byteArray.asList,
>>> 	byteArray.utf8String
>>> )
(8750, [226 136 174], '∮')
```

Plot Utf-8 code points of a String:

~~~spl svg=A
'utf8ByteArray'
.utf8ByteArray
.asList
.discretePlot
~~~

![](sw/spl/Help/Image/utf8ByteArray-A.svg)

* * *

See also: asciiByteArray, ByteArray, String, Utf8Stream, utf8String, utf16List

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToCharacterCode.html)
[2](https://reference.wolframcloud.com/language/ref/StringToByteArray.html)

Categories: String, Encoding
