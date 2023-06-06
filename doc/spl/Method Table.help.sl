# Method Dictionary

The method dictionary is an _Dictionary_.
The keys are method names and the values are _arity tables_.

An arity table is an _Dictionary_.
The keys are integers and the values are _type tables_.

A type table is an _Dictionary_.
The keys are type names and the values are _Method_ values.

The method dictionary is reflected in the _system_ value.

```
system.methodDictionary.isDictionary = true
system.methodDictionary::collect.isDictionary = true
system.methodDictionary::collect[2].isDictionary = true
system.methodDictionary::collect[2]::Array.isMethod = true
```
