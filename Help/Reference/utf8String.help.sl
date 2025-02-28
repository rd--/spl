# utf8String

- _utf8String(aList)_

Answer a String of the Utf-8 decoding of _aList_,
which must be a valid Utf-8 sequence.

```
>>> [226 130 172].utf8String
'€'

>>> '€'.utf8ByteArray.utf8String
'€'
```

Create a string from a `List`, assuming it contains UTF-8 data:

```
>>> [97 65 206 177].utf8String
'aAα'

>>> [
>>> 	195 139 65 195 146 75 195 135 120 195
>>> 	129 115 195 137 93
>>> ].utf8String
'ËAÒKÇxÁsÉ]'
```

`utf8String` is the inverse of `utf8ByteArray` and `utf8List`:

```
>>> let string = 'Input and output';
>>> string.utf8List.utf8String
string
```

Not all byte sequences are valid UTF-8 codes:

```
>>> [126 162 195 136].utf8String
'~�È'

>>> '~�È'.utf8List
[126 239 191 189 195 136]
```

* * *

See also: asciiString, ByteArray, String, utf8ByteArray, utf16List

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ByteArrayToString.html)

Categories: String, Encoding
