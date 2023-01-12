# Method Table

The method table is an _IdentityDictionary_.
The keys are method names and the values are _arity tables_.

An arity table is an _IdentityDictionary_.
The keys are integers and the values are _type tables_.

A type table is an _IdentityDictionary_.
The keys are type names and the values are _Method_ values.

The method table is stored in the _system_ dictionary.

```
system::methodTable.isIdentityDictionary = true
system::methodTable::collect.isIdentityDictionary = true
system::methodTable::collect[2].isIdentityDictionary = true
system::methodTable::collect[2]::Array.isMethod = true
```
