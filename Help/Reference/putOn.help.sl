# putOn

- _putOn(anObject | aList, aStream)_

Write _anObject_, or the items of _aList_, onto _aStream_.

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
