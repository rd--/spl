# position

- _position(aStream)_

Answer the index preceding the next element in the stream.
Unless the stream is at the start, this is also the index of the previous element of the stream.
The index corresponding to the beginning of the stream is 0.

- _position(aStream, anInteger)_

Set the current position for accessing the objects in _aStream_ to be _anInteger_,
as long as _anInteger_ is within the bounds of _aStream_.
If it is not, create an error notification.

* * *

See also: Stream

Categories: Positioning
