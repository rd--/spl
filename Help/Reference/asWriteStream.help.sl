# asWriteStream

- _asWriteStream(c)_

Answer a `MutableCollectionStream` on the collection _c_.

`nextPut` writes a value to the stream,
`contents` answers the contents of the stream:

```
>>> let w = [].asWriteStream;
>>> w.nextPut(1);
>>> w.contents
[1]
```

`nextPutAll` puts each of the items onto the stream in turn:

```
>>> let w = [].asWriteStream;
>>> w.nextPut(1);
>>> w.nextPutAll([2 .. 8]);
>>> w.nextPut(9);
>>> w.contents
[1 .. 9]
```

* * *

See also: MutableCollectionStream, nextPut, nextPutAll, Stream, WriteStream

Guides: Stream Functions

Categories: Converting
