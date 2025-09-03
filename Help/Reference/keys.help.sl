# keys

- _keys(d)_

Answer the keys of the `Dictionary` _d_.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).keys
['x' 'y' 'z']
```

At `Map`:

```
>>> ['x' -> 1, 'y' -> 2, 'z' -> 3]
>>> .asMap
>>> .keys
['x' 'y' 'z']
```

At a `List` of `Association`s:

```
>>> ['x' -> 1, 'y' -> 2, 'z' -> 3].keys
['x' 'y' 'z']
```

* * *

See also: associations, Dictionary, indices, values

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Keys.html),
_Smalltalk_
5.7.2.10

Categories: Accessing
