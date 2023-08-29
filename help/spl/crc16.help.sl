# crc16 -- comparing

- _crc16(aByteArray | aString)_

Compute a 16 bit cyclic redundancy check.
In the String case the check is made of the _utf8ByteArray_ of the string.

	'string'.crc16 = 58909
	[115, 116, 114, 105, 110, 103].ByteArray.crc16 = 58909

* * *

See also: ByteArray, String, utf8ByteArray
