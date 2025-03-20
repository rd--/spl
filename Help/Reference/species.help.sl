# species

- _species(anObject)_

Answers the primary factory method for the type of _anObject_,
or a more specific constructor if required.

```
>>> [1 3 5].species
List:/1

>>> [1 3 5].asIdentityBag.species
IdentityBag:/0

>>> [1 3 5].asIdentitySet.species
IdentitySet:/0

>>> (x: 1, y: 3, z: 5).species
Record:/0
```

This is the mechanism by which `Trait` methods can generate new values of the required `Type`.

```
>>> [1 3 5].select { :x |
>>> 	x > 1
>>> }
[3 5]

>>> [1 3 5].asIdentitySet.select { :x |
>>> 	x > 1
>>> }
[3 5].asIdentitySet

>>> [1 3 5].asIdentityBag.select { :x |
>>> 	x > 1
>>> }
[3 5].asIdentityBag

>>> (x: 1, y: 3, z: 5).select { :x |
>>> 	x > 1
>>> }
(y: 3, z: 5)
```

The `species` of a `ResidueSet` constructs a set with the same modulus:

```
>>> 6.leastResidueSystem.select(isOdd:/1)
[1 3 5].asResidueSet(6)
```

* * *

See also: new, newFrom, ofSize, Trait, Type, typeOf

Categories: Reflection
