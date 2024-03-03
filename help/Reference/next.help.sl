# next

- _next(aStream)_
- _next(aStream, anInteger)_

Answer the next object accessible by _aStream_.
Fail if the stream is positioned at its end, or if the position is out of bounds in the collection.

Answer the next _anInteger_ number of objects accessible by _aStream_.
If the stream ends, the answer will contain _nil_ elements, see _nextOrUpToEnd_.

* * *

See also: contents, reset, Stream

References:
_Smalltalk_
5.10.2.1

Categories: Accessing
