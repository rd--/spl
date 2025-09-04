# isDictionary

- _isDictionary(x)_

Answer `true` if the object _x_ is an instance of a type that implements the `Dictionary` trait,
else `false`.

At `Record`:

```
>>> (a: 1, b: 2, c: 3)
>>> .isDictionary
true
```

At `Map`:

```
>>> [1: 'a', 2: 'b', 3: 'c']
>>> .isDictionary
true
```

An association list is not a dictionary:

```
>>> [1 -> 'a', 2 -> 'b', 3 -> 'c']
>>> .isDictionary
false
```

* * *

See also: Dictionary, Map, Record

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AssociationQ.html)
