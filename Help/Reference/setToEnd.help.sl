# setToEnd

- _setToEnd(s)_

Move the position index to the end of the stream _s_.

```
>>> let stream = 1:9.Stream;
>>> stream.setToEnd;
>>> (stream.position, stream.next!)
(9, nil)
```

* * *

See also: PositionableStream, position, reset!
