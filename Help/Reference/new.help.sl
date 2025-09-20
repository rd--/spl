# new

- _new(f:/0)_
- _new(f:/1, n)_

Implement the Smalltalk idioms _c.species.new_ and _c.species.new(n)_.

The unary form, for collections where `species` answers a no-argument block:

```
>>> IdentitySet().species
IdentitySet:/0

>>> IdentitySet().species.new
IdentitySet()
```

The unary form, for collections where `species` answers a one-argument block:

```
>>> [].species
List:/1

>>> [].species.new(3)
[nil nil nil]
```

* * *

See also: ofSize, newFrom, species

Guides: Collection Functions

References:
_Smalltalk_
5.3.9.1

Categories: Instance Creation, Reflection
