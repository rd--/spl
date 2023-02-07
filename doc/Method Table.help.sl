# Method Dictionary

The method dictionary is an _IdentityDictionary_.
The keys are method names and the values are _arity tables_.

An arity table is an _IdentityDictionary_.
The keys are integers and the values are _type tables_.

A type table is an _IdentityDictionary_.
The keys are type names and the values are _Method_ values.

The method dictionary is reflected in the _system_ value.

```
system.methodDictionary.isIdentityDictionary = true
system.methodDictionary::collect.isIdentityDictionary = true
system.methodDictionary::collect[2].isIdentityDictionary = true
system.methodDictionary::collect[2]::Array.isMethod = true
```
