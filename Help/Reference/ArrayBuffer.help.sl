# ArrayBuffer

- _ArrayBuffer(n)_

An `ArrayBuffer` is a `Type` representing a binary data buffer.

Create new zeroed array buffer of eight bytes:

```
>>> ArrayBuffer(8).byteSize
8
```

Create new zeroed array buffer of sixteen bytes and form a `Float32Array` upon it:

```
>>> ArrayBuffer(16)
>>> .asFloat32Array
>>> .asList
[0 0 0 0]
```

The `ArrayBuffer` underlying a typed array can be retrieved using the `buffer` method:

```
>>> [1 2 3 4]
>>> .asFloat32Array
>>> .buffer
>>> .isArrayBuffer
true
```

* * *

See also: ByteArray, Float32Array, Float64Array

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/structured-data.html#sec-arraybuffer-objects)

Categories: Collection
