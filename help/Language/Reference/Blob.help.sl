# Blob -- system trait & type

- _Blob(anArray)_
- _Blob(aByteArray)_

A Blob is an opaque type containg binary data.

	[1 .. 9].asByteArray.asBlob.size = 9
	[65 .. 69].asByteArray.asBlob.text.then { :answer | (answer = 'ABCDE').postLine }

* * *

See also: File
