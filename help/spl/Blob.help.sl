# Blob -- binary data

- _Blob(anArray)_
- _Blob(aByteArray)_

A Blob is an opaque type containg binary data.

	[1 .. 9].ByteArray.Blob.size = 9
	[65 .. 69].ByteArray.Blob.text.then { :answer | (answer = 'ABCDE').postLine }
