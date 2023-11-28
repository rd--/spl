# utf8String -- string encoding

- _utf8String(aByteArray)_

Answer a String of the Utf-8 decoding of _aByteArray_ (which must be a valid Utf-8 sequence).

	[226 130 172].asByteArray.utf8String = '€'
	'€'.utf8ByteArray.utf8String = '€'

* * *

See also: asciiString, ByteArray, String, utf8ByteArray, utf16Array
