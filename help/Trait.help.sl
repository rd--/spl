# Trait -- behaviour type

A _Trait_ is a named _Method_ dictionary.

The dictionary keys are _qualified_ method names, i.e. _sum:/1_.

```
system.traitDictionary.isIdentityDictionary = true
system.traitDictionary.includesKey('Collection') = true
system.trait('Collection').isTrait = true
system.trait('Collection').name = 'Collection'
system.trait('Collection').methodDictionary.includesKey('sum:/1') = true
system.trait('Collection').methodDictionary::sum:/1.isMethod = true
```
