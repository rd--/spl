# AsciiStream

- _AsciiStream(anInteger=100)_

Answer a `MutableCollectionStream` on a `ByteArray` on which `String` values can be written using `encodeOn`.

Encode a `String` onto the stream,
and decode the `contents` using `utf8String`:

```
>>> let w = AsciiStream();
>>> 'ascii'.encodeOn(w);
>>> w.contents.asciiString
'ascii'
```

The `asciiContents` method combines `contents` and `asciiString`:

```
>>> let w = AsciiStream();
>>> 'ascii'.encodeOn(w);
>>> w.asciiContents
'ascii'
```

`printOn` combines `encodeOn` and `printString`:

```
>>> let w = AsciiStream();
>>> [3.141, nil].do { :each |
>>> 	each.printOn(w)
>>> };
>>> w.asciiContents
'3.141nil'
```

`asciiStringStreamContents` constructs the stream,
runs an encoding block,
and answers the finale stream contents as a `String`:

```
>>> { :stream |
>>> 	'ascii'.encodeOn(stream)
>>> }.asciiStringStreamContents
'ascii'
```

* * *

See also: asciiContents, asciiString, ByteArray, contents, encodeOn, MutableCollectionStream, printString, String, Utf8Stream
