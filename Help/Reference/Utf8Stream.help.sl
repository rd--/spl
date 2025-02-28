# Utf8Stream

- _Utf8Stream(anInteger=100)_

Answer a `MutableCollectionStream` on a `ByteArray` on which `String` values can be written using `encodeOn`.

Encode a `String` onto the stream,
and decode the `contents` using `utf8String`:

```
>>> let w = Utf8Stream();
>>> 'bodlɛʁ'.encodeOn(w);
>>> w.contents.utf8String
'bodlɛʁ'
```

The `utf8Contents` method combines `contents` and `utf8String`:

```
>>> let w = Utf8Stream();
>>> 'bodlɛʁ'.encodeOn(w);
>>> w.utf8Contents
'bodlɛʁ'
```

`printOn` combines `encodeOn` and `printString`:

```
>>> let w = Utf8Stream();
>>> [3.141, nil].do { :each |
>>> 	each.printOn(w)
>>> };
>>> w.utf8Contents
'3.141nil'
```

* * *

See also: AsciiStream, ByteArray, contents, encodeOn, MutableCollectionStream, printString, String, utf8Contents, utf8String
