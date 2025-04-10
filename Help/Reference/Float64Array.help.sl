# Float64Array

- _Float64Array(n)_
- _Float64Array([x, …])_

In the `Integer` case,
answer a `Float64Array` of _n_ places, each initialized to `zero`.

```
>>> Float64Array(5)
Float64Array([0 0 0 0 0])
```

In the `List` case,
answer a `Float64Array` initialized to _[x, …]_:

```
>>> Float64Array([1 2 3 4 5])
>>> .asList
[1 2 3 4 5]
```

A `Float64Array` is an array whose elements are IEEE 64-bit floating point values.
Unlike a `List`, a `Float64Array` is of fixed size.

* * *

See also: asFloat64Array, ByteArray, List, Float32Array

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#table-49)

Categories: Collection, Type
