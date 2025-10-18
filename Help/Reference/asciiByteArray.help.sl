# asciiByteArray

- _asciiByteArray(s)_

Answer a `ByteArray` of the Ascii encoding of the string _s_,
which must be an Ascii string.

```
>>> 'ascii'.asciiByteArray
[97 115 99 105 105].asByteArray

>>> '09AZaz'.asciiByteArray
[48 57 65 90 97 122].asByteArray
```

The inverse is `asciiString`:

```
>>> [97 115 99 105 105]
>>> .asByteArray
>>> .asciiString
'ascii'
```

It is an error if the string contains non-Ascii characters:

```
>>> {
>>> 	'Mačiūnas'.asciiByteArray
>>> }.hasError
true
```

* * *

See also: ascii, asciiString, ByteArray, String, utf8ByteArray, utf8String, utf16List

Guides: String Functions

Categories: String, Encoding
