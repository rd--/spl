# addUtf8Encoded!

- _addUtf8Encoded!(c, s)_

Add the bytes of the Utf-8 encoding of the string _s_ to the collection _c_.

Ascii is a subset of Utf-8:

```
>>> let a = [];
>>> let b = a.addUtf8Encoded!('ascii');
>>> (a, b, a.asciiString)
(
	[97 115 99 105 105],
	ByteArray[97 115 99 105 105],
	'ascii'
)
```

Encode a non-Ascii `String`:

```
>>> let a = [];
>>> let b = a.addUtf8Encoded!('bodlɛʁ');
>>> (a, b, a.utf8String)
(
	[98 111 100 108 201 155 202 129],
	ByteArray[98 111 100 108 201 155 202 129],
	'bodlɛʁ'
)
```

Combine with `printString`:

```
>>> let a = [];
>>> [3.141, nil].do { :each |
>>> 	a.addUtf8Encoded!(
>>> 		each.printString
>>> 	)
>>> };
>>> a.asciiString
'3.141nil'
```

* * *

See also: String, asciiString, printString

Guides: String Functions
