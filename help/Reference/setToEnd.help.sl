# setToEnd

- _setToEnd(aStream)_

Move the position index to the end of the stream.

```
>>> let stream = 1:9.asStream;
>>> stream.setToEnd;
>>> (stream.position, stream.next)
(9, nil)
```

* * *

See also: position, PositionableStream, reset
