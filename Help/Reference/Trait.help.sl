# Trait

A `Trait` is a `Type` that holds a named `Method` dictionary.

The dictionary keys are _qualified_ method names, i.e. _sum:/1_.

The `System` holds a dictionary of traits indexed by name:

```
>>> system.traitDictionary.isDictionary
true

>>> let d = system.traitDictionary;
>>> d.includesKey('Collection')
true
```

`traitLookup` answers the named trait:

```
>>> system
>>> .traitLookup('Collection')
>>> .isTrait
true

>>> system
>>> .traitLookup('Collection')
>>> .name
'Collection'
```

The `methodDictionary` of a `Trait` holds `Method` values:

```
>>> system
>>> .traitLookup('Iterable')
>>> .methodDictionary
>>> .includesKey('sum:/1')
true

>>> system
>>> .traitLookup('Iterable')
>>> .methodDictionary['sum:/1']
>>> .isMethod
true
```

* * *

See also: Method, System, Type

Guides: Reflection Functions, What is a Trait

Further Reading: Cannon 1982, Curry 1982, Moon 1986, Weinreb 1980, Ungar and Smith 1987

Categories: Behaviour, Type
