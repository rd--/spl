# AsciiStream

- _AsciiStream(n=100)_

Answer a `MutableCollectionStream` on a `ByteArray`,
to which `String` values can be written using `addEncoded!`.

Encode a `String` onto the stream,
and decode the `contents` using `utf8String`:

```
>>> let w = AsciiStream();
>>> w.addEncoded!('ascii');
>>> w.contents.asciiString
'ascii'
```

The `asciiContents` method combines `contents` and `asciiString`:

```
>>> let w = AsciiStream();
>>> w.addEncoded!('ascii');
>>> w.asciiContents
'ascii'
```

Combines with `printString`:

```
>>> let w = AsciiStream();
>>> [3.141, nil].do { :each |
>>> 	w.addEncoded!(each.printString)
>>> };
>>> w.asciiContents
'3.141nil'
```

`asciiStringStreamContents` constructs the stream,
runs an encoding block,
and answers the final stream contents as a `String`:

```
>>> { :stream |
>>> 	stream.addEncoded!('ascii')
>>> }.asciiStringStreamContents
'ascii'
```

* * *

See also: ByteArray, MutableCollectionStream, String, Utf8Stream, asciiContents, asciiString, contents, printString

Guides: Stream Functions, String Functions
