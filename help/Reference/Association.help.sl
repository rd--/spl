# Association

- _Association(key, value)_

An `Association` is a `Type` that connects a `key` with a `value`.

Retrieve the `key` and the `value` of an `Association` between a `String` and a `Number`:

```
>>> let a = Association('x', 1);
>>> (a.key, a.value)
('x', 1)
```

The operator form of `Association` is `->`:

```
>>> 'x' -> 1
Association('x', 1)
```

Instances are ordinarily entries in a `Dictionary` type, i.e. `Map` or `Record`:

```
>>> (x: 1, y: 2, z: -0).associations
['x' -> 1, 'y' -> 2, 'z' -> -0]
```

A `List` with only `Association` entries is called an _association list_.

_Note_:
Equality considers both _key_ & _value_, unlike in Smalltalk-80.
In a `Dictionary` context there cannot be duplicate keys, hence considering only key for equality.

* * *

See also: ->, associations

Categories: Collection, Type
