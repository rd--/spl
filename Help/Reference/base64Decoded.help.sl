# base64Decoded

- _base64Decoded(aString)_

Decode _aString_ from base 64.
The answer is a `ByteArray`.

Decode an encoded `ByteArray`:

```
>>> 'AQIDBAUGBwgJCgsMDQ4PEB'
>>> .base64Decoded
[1 .. 16].asByteArray
```

Decode an encoded Ascii `String`:

```
>>> 'SGVsbG8gV29ybGQ='
>>> .base64Decoded
>>> .asciiString
'Hello World'
```

Decode `ByteArray` and Ascii `String`:

```
>>> let e = 'ezEsIDIsIDMsIDQsIDV9';
>>> let d = e.base64Decoded;
>>> (d.asList, d.asciiString)
(
	[
		123  49  44  32  50
		 44  32  51  44  32
		 52  44  32  53 125
	],
	'{1, 2, 3, 4, 5}'
)
```

The inverse is `base64Encoded`:

```
>>> let b = 1:9.asByteArray;
>>> let e = b.base64Encoded;
>>> (e, e.base64Decoded)
(
	'AQIDBAUGBwgJ',
	1:9.asByteArray
)
```

Out of range values raise an error:

```
>>> {
>>> 	'ABαCD'.base64Decoded
>>> }.ifError { true }
true
```

* * *

See also: base64Encoded

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseDecode.html)

Categories: Converting
