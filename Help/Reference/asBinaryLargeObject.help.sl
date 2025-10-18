# asBinaryLargeObject

- _asBinaryLargeObject(x)_

Convert the object _x_ into a `BinaryLargeObject`.
Implemented for `List`, `ByteArray` and `Float64Array`.

At `ByteArray` encloses data:

```
>>> let x = ByteArray([1 .. 9]);
>>> let b = x.asBinaryLargeObject;
>>> (x.size, b.size, b.type)
(9, 9, '')
```

At `Float64Array` encloses data as a byte array:

```
>>> let x = Float64Array([1 .. 9]);
>>> let b = x.asBinaryLargeObject;
>>> (x.size, b.size, b.type)
(9, 72, '')
```

Fetch text from `BinaryLargeObject`:

~~~spl async
[65 .. 69]
.asByteArray
.asBinaryLargeObject
.text
~~~

* * *

See also: BinaryLargeObject

Categories: Converting
