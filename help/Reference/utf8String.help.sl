# utf8String

- _utf8String(aByteArray)_

Answer a String of the Utf-8 decoding of _aByteArray_,
which must be a valid Utf-8 sequence.

```
>>> [226 130 172].asByteArray.utf8String
'€'

>>> '€'.utf8ByteArray.utf8String
'€'
```

Create a string from a ByteArray, assuming it contains UTF-8 data:

```
>>> [97 65 206 177].asByteArray.utf8String
'aAα'

>>> let list = [195 139 65 195 146 75 195 135 120 195 129 115 195 137 93];
>>> let bytes = list.asByteArray;
>>> bytes.utf8String
'ËAÒKÇxÁsÉ]'
```

_utf8String_ is the inverse of _utf8ByteArray_:

```
>>> let string = "Input and output";
>>> string.utf8ByteArray.utf8String
string
```

Not all byte sequences are valid UTF-8 codes:

```
>>> [126 162 195 136].asByteArray.utf8String
'~�È'

>>> '~�È'.utf8ByteArray
[126 239 191 189 195 136].asByteArray
```

* * *

See also: asciiString, ByteArray, String, utf8ByteArray, utf16List


References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ByteArrayToString.html)

Categories: String, Encoding
