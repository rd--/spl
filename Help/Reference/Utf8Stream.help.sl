# Utf8Stream

- _Utf8Stream(n=100)_

Answer a `MutableCollectionStream` on a `ByteArray`,
on which `String` values can be written using `addEncoded!`.

Encode a `String` onto the stream,
and decode the `contents` using `utf8String`:

```
>>> let w = Utf8Stream();
>>> w.addEncoded!('bodlɛʁ');
>>> w.contents.utf8String
'bodlɛʁ'
```

The `utf8Contents` method combines `contents` and `utf8String`:

```
>>> let w = Utf8Stream();
>>> w.addEncoded!('bodlɛʁ');
>>> w.utf8Contents
'bodlɛʁ'
```

Combines with `printString`:

```
>>> let w = Utf8Stream();
>>> [3.141, nil].do { :each |
>>> 	w.addEncoded!(each.printString)
>>> };
>>> w.utf8Contents
'3.141nil'
```

* * *

See also: AsciiStream, ByteArray, MutableCollectionStream, String, contents, printString, utf8Contents, utf8String

Guides: Stream Functions, String Functions
