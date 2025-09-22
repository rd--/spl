# position

- _position(s)_
- _position(s, n)_

In the unary case, answer the index preceding the next element in the stream.

Unless the stream is at the start, this is also the index of the previous element of the stream.
The position index corresponding to the beginning of the stream is `zero`.

```
>>> let s = [1 3 5 7 9].asStream;
>>> (s.position, s.next(2), s.position)
(0, [1 3], 2)
```

In the binary case,
set the current position for accessing the objects in the stream _s_ to be _n_,
as long as _n_ is within the bounds of _s_.
If it is not, create an `error` notification.

Move to indicated position,
which is the index before the next element:

```
>>> let s = [1 3 5 7 9].asStream;
>>> s.position(3);
>>> s.next
7
```

It is an `error` to move the position out of bounds:

```
>>> {
>>> 	[].asStream.position := -1
>>> }.hasError
true

>>> {
>>> 	[].asStream.position := 1
>>> }.hasError
true
```

* * *

See also: asStream, skip, PositionableStream, Stream

Guides: Stream Functions

References:
_Smalltalk_
5.9.1.4
5.9.1.5

Categories: Positioning
