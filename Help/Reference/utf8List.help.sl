# utf8List

- _utf8List(s)_

Answer the Utf-8 encoding of the string _s_ as a `List`.

Compare to `utf16List`

```
>>> 'Mačiūnas'.utf8List
[77 97 196 141 105 197 171 110 97 115]

>>> 'Mačiūnas'.utf16List
[77 97 269 105 363 110 97 115]
```

The inverse is `utf8String`:

```
>>> [77 97 196 141 105 197 171 110 97 115]
>>> .utf8String
'Mačiūnas'
```

* * *

See also: ByteArray, List, String, utf16List, utf8ByteArray

Guides: String Functions
