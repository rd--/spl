# associations

- _associations(d)_

Answer a `List` of the `Association` values held by the dictionary like object _d_.

At `Record`:

```
>>> (x: 1, y: 2, z: 3).associations
['x' -> 1, 'y' -> 2, 'z' -> 3]

>>> (:).associations
[]
```

At `Map`:

```
>>> [1: 'x', 2: 'y', 3: 'z']
>>> .associations
[1 -> 'x', 2 -> 'y', 3 -> 'z']

>>> [:].associations
[]
```

At `Multiset`:

```
>>> 'abracadabra'
>>> .characters
>>> .asMultiset
>>> .associations
[
	'a' -> 5, 'b' -> 2, 'r' -> 2,
	'c' -> 1, 'd' -> 1
]
```

At a `List` of `Association` values:

```
>>> ['x' -> 1, 'y' -> 2, 'z' -> 3]
>>> .associations
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

At `TimeSeries`:

```
>>> TimeSeries(
>>> 	[2 1; 5 6; 10 5; 12 7; 15 4]
>>> ).associations
[2 -> 1, 5 -> 6, 10 -> 5, 12 -> 7, 15 -> 4]
```

At `RunArray`:

```
>>> RunArray([1, 3, 5], ['a', 'b', 'c'])
>>> .associations
[1 -> 'a', 3 -> 'b', 5 -> 'c']
```

To get the associations swapped,
so that the left hand side is the value and the right hand side is the key,
use `associationsSwapped`:

```
>>> (x: 1, y: 2, z: 3)
>>> .associationsSwapped
[1 -> 'x', 2 -> 'y', 3 -> 'z']
```

* * *

See also: ->, associationsDo, associationsSwapped, Association, Dictionary, indexValueAssociations, keys, values

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normal.html)

Categories: Accessing
