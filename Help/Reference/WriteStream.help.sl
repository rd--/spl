# WriteStream

- _WriteStream([x₁ x₂ …])_

`WriteStream` is a constructor for write stream types.

At `List`,
`add!` writes a value to the stream,
`contents` answers the contents of the stream:

```
>>> let w = WriteStream[];
>>> w.add!(1);
>>> w.contents
[1]
```

`addAll!` puts each of the items onto the stream in turn:

```
>>> let w = WriteStream[];
>>> w.add!(1);
>>> w.addAll!([2 .. 8]);
>>> w.add!(9);
>>> w.contents
[1 .. 9]
```

* * *

See also: Add, Stream

Guides: Stream Functions

Categories: Collection, Trait
