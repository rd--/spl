# putOn

- _putOn(x, s)_

Write the object _x_, or the items of _x_ if it is a list, onto the stream _s_.

In the `Object` case, equivalent to `swap` of `nextPut`.

```
>>> let w = [].asWriteStream;
>>> 1.putOn(w);
>>> w.contents
[1]
```

In the `List` case, equivalent to `swap` of `nextPutAll`:

```
>>> let w = [].asWriteStream;
>>> 1.putOn(w);
>>> [2 .. 8].putOn(w);
>>> 9.putOn(w);
>>> w.contents
[1 .. 9]
```

* * *

See also: nextPut, nextPutAll, swap, WriteStream

Guides: Stream Functions
