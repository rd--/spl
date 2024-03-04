# position

- _position(aStream)_
- _position(aStream, anInteger)_

In the unary case, answer the index preceding the next element in the stream.
Unless the stream is at the start, this is also the index of the previous element of the stream.
The index corresponding to the beginning of the stream is 0.

In the binary case, set the current position for accessing the objects in _aStream_ to be _anInteger_,
as long as _anInteger_ is within the bounds of _aStream_.
If it is not, create an error notification.

* * *

See also: Stream

References:
_Smalltalk_
5.9.1.4
5.9.1.5

Categories: Positioning
