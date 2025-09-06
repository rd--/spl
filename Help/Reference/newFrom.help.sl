# newFrom

- _newFrom(aBlock:/1, anObject)_ ⟹ _aBlock(anObject)_

Implements the Smalltalk idiom _aCollection.species.newFrom(anotherCollection)_.

At `List`:

```
>>> List:/1.newFrom(1:9)
[1 2 3 4 5 6 7 8 9]

>>> [].species.newFrom(1:9)
[1 2 3 4 5 6 7 8 9]
```

At `IdentitySet`:

```
>>> IdentitySet:/0.newFrom(1:9)
1:9.asIdentitySet
```

* * *

See also: fillFrom, new, species

Categories: Instance Creation, Reflection
