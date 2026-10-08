# WriteStream

- _WriteStream([x₁ x₂ …])_

`WriteStream` is both a `Trait`,
that requires the method `nextPut` to puts an item onto the stream,
and a constructor for write stream types.

At `List`,
answer a `MutableCollectionStream` on the collection _c_.
`nextPut` writes a value to the stream,
`contents` answers the contents of the stream:

```
>>> let w = WriteStream[];
>>> w.nextPut(1);
>>> w.contents
[1]
```

`nextPutAll` puts each of the items onto the stream in turn:

```
>>> let w = WriteStream[];
>>> w.nextPut(1);
>>> w.nextPutAll([2 .. 8]);
>>> w.nextPut(9);
>>> w.contents
[1 .. 9]
```

`WriteStream` is a trait:

```
>>> system
>>> .traitDictionary['WriteStream']
>>> .isTrait
true
```

List of types implementing `WriteStream`:

```
>>> system
>>> .traitTypes('@WriteStream')
>>> .sort!
[
	'MutableCollectionStream'
]
```

* * *

See also: nextPut, nextPutAll, MutableCollectionStream, ReadStream, Stream

Guides: Stream Functions

Categories: Collection, Trait
