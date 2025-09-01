# peekFor

- _peekFor(s, x)_

Answer `false` and do not move over the next element of the stream _s_ if it is not equal to the object _x_,
or if the _s_ is at the end.
Answer `true` and increment the position for accessing elements,
if the next element is equal to `x`.

```
>>> let s = [1 2 3 4 5].asStream;
>>> (
>>> 	s.peekFor(1),
>>> 	s.next,
>>> 	s.peekFor(5),
>>> 	s.peekFor(3),
>>> 	s.next
>>> )
(true, 2, false, true, 4)
```

* * *

See also: peek, Stream

Guides: Stream Functions

References:
_Smalltalk_
5.9.2.8

Categories: Accessing
