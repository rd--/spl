# Trait

A `Trait` is a named `Method` dictionary.

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
>>> system.traitLookup('Collection').isTrait
true

>>> system.traitLookup('Collection').name
'Collection'
```

The `methodDictionary` of a `Trait` holds `Method` values:

```
>>> let t = system.traitLookup('Iterable');
>>> t.methodDictionary.includesKey('sum:/1')
true

>>> let t = system.traitLookup('Iterable');
>>> t.methodDictionary['sum:/1'].isMethod
true
```

* * *

See also: Method, System, Type

Categories: Behaviour, Type
