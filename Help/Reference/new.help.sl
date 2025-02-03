# new

- _new(aBlock:/0)_ ⟹ _aBlock()_
- _new(aBlock:/1, anObject)_ ⟹ _aBlock(anObject)_

The unary form implements the Smalltalk idiom _aCollection.species.new()_.

```
>>> IdentitySet().species
IdentitySet:/0

>>> IdentitySet().species.new
IdentitySet()
```

The binary form implements the Smalltalk idiom _aCollection.species.new(aSize)_.

```
>>> [].species
List:/1

>>> [].species.new(3)
[nil nil nil]
```

* * *

See also: ofSize, newFrom, species

References:
_Smalltalk_
5.3.9.1

Categories: Instance Creation, Reflection
