# asciiByteArray

- _asciiByteArray(aString)_

Answer a `ByteArray` of the Ascii encoding of _aString_, which must be an Ascii string.

```
>>> 'ascii'.asciiByteArray
[97 115 99 105 105].asByteArray
```

The inverse is `asciiString`:

```
>>> [97 115 99 105 105].asByteArray.asciiString
'ascii'
```

It is an error if the string contains non-Ascii characters:

```
>>> { 'Mačiūnas'.asciiByteArray }.ifError { true }
true
```

* * *

See also: asciiString, ByteArray, String, utf8ByteArray, utf8String, utf16List

Categories: String, Encoding
