# base64Decode

- _base64Decode(s)_

Answer the `ByteArray` encoded in Base-64 notation at the string _s_.

Decode an encode `ByteArray`:

```
>>> 'AQIDBAUGBwgJCgsMDQ4PEB'
>>> .base64Decode
[1 .. 16].asByteArray
```

Decode an encode Ascii `String`:

```
>>> 'SGVsbG8gV29ybGQ='
>>> .base64Decode
>>> .asciiString
'Hello World'
```

White space is ignored:

```
>>> [
>>> 	'TWFueSBoYW5kcyBtYWt'
>>> 	' 	'
>>> 	'lIGxpZ2h0IHdvcmsu'
>>> ]
>>> .stringCatenate
>>> .base64Decode
>>> .asciiString
'Many hands make light work.'
```

Decode `ByteArray` and Ascii `String`:

```
>>> let e = 'ezEsIDIsIDMsIDQsIDV9';
>>> let d = e.base64Decode;
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

The inverse is `base64Encode`:

```
>>> let b = 1:9.asByteArray;
>>> let e = b.base64Encode;
>>> (e, e.base64Decode)
(
	'AQIDBAUGBwgJ',
	1:9.asByteArray
)
```

Out of range values raise an error:

```
>>> {
>>> 	'ABαCD'.base64Decode
>>> }.ifError { true }
true
```

* * *

See also: base64Encode, parseBase64

References:
_Ietf_
[1](https://www.rfc-editor.org/rfc/rfc4648),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseDecode.html),
_W_
[1](https://en.wikipedia.org/wiki/Base64)

Categories: Converting
