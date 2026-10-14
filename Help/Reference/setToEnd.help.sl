# setToEnd!

- _setToEnd!(s)_

Move the position index to the end of the stream _s_.

```
>>> let stream = Stream(1:9);
>>> stream.setToEnd!;
>>> (stream.position, stream.next)
(9, nil)
```

* * *

See also: Stream, position, reset!
