# Association

- _Association(k, v)_

An `Association` is a `Type` that connects a key _k_ with a value _v_.

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

Equality considers both _key_ & _value_, unlike in Smalltalk-80:

```
>>> ('x' -> 1) != ('y' -> 1)
true
```

The `~` operator compares keys using `=` and values using `~`:

```
>>> (3 -> 1) ~ (3 -> 1.0001)
true

>>> (1 -> 3) ~ (1.0001 -> 3)
false
```

The print string is given using the `->` operator,
the store string is similar but adds parentheses:

```
>>> (0 -> 1).printString
'0 -> 1'

>>> (0 -> 1).storeString
'(0 -> 1)'
```

Fetch both key and value:

```
>>> ('x' -> 1).asList
['x' 1]
```

_Note_:
In a `Dictionary` context there cannot be duplicate keys, hence considering only key for equality in St-80.

* * *

See also: ->, <-, associations, key, value

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rule.html)

Unicode: U+2190 → Rightwards Arrow

Categories: Collection, Type
