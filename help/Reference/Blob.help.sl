# Blob

- _Blob(aList | aByteArray)_

A Blob represents a "Binary Large Object".

A Blob is an opaque type containg immutable binary data.

`[1 .. 9].asByteArray.asBlob.size = 9`

`[65 .. 69].asByteArray.asBlob.text.then { :answer | (answer = 'ABCDE').postLine }`

* * *

See also: File

Categories: System, Trait, Type
