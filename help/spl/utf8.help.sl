# utf8 -- string encoding

- _utf8(aString)_

Answer a _ByteArray_ of the Utf-8 encoding of _aString_.

	'€'.utf8 = [226, 130, 172].ByteArray

- _utf8(aByteArray)_

Answer a _String_ of the Utf-8 decoding of _ByteArray_ (which must be a valid Utf-8 sequence).

	[226, 130, 172].ByteArray.utf8 = '€'
	'€'.utf8.utf8 = '€'

* * *

See also: ascii, String, utf16
