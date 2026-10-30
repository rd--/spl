# species

- _species(x)_

Answers the primary factory method for the type of the object _x_,
or a more specific constructor if required.
The answer block may be nullary or unary.

```
>>> [1 3 5].species
nilList/1

>>> (:).species
Record/0

>>> Set([1 3 5], ==).species
IdentitySet/0

>>> (x: 1, y: 3, z: 5).species
Record/0
```

This is the mechanism by which `Trait` methods can generate new values of the required `Type`:

```
>>> [1 3 5].select { :x |
>>> 	x > 1
>>> }
[3 5]

>>> Set([1 3 5], ==)
>>> .select { :x |
>>> 	x > 1
>>> }
Set([3 5], ==)

>>> Multiset([1 3 5], ==)
>>> .select { :x |
>>> 	x > 1
>>> }
Multiset([3 5], ==)

>>> (x: 1, y: 3, z: 5)
>>> .select { :x |
>>> 	x > 1
>>> }
(y: 3, z: 5)
```

The `species` of a `ResidueSet` constructs a set with the same modulus:

```
>>> 6.leastResidueSystem
>>> .select(isOdd/1)
ResidueSet([1 3 5], 6)
```

* * *

See also: New, Trait, Type, new, newFrom, ofSize, typeName

Guides: Collection Functions, Reflection Functions
