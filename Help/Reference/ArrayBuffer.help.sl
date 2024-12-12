# ArrayBuffer

- _ArrayBuffer(anInteger)_

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

Categories: Collection
