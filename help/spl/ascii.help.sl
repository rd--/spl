# ascii -- encoding

- _ascii(aString)_

Answer a _ByteArray_ of the Ascii encoding of _aString_.

	'ascii'.ascii = [97, 115, 99, 105, 105].ByteArray

- _ascii(aByteArray)_

Answer a _String_ of _ByteArray_ which must be an Ascii encoding.

	[97, 115, 99, 105, 105].ByteArray.ascii = 'ascii'
	'ascii'.ascii.ascii = 'ascii'

* * *

See also: utf8
