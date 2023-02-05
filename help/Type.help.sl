# Type -- value type

A _Type_ is describes a kind of value.

The _system_ dictionary holds a _typeDictionary_.

```
system.typeDictionary.isIdentityDictionary = true
system.typeDictionary.includesKey('Array') = true
system.type('Array').isType = true
system.type('Array').name = 'Array'
system.type('Array').methodDictionary.includesKey('copy:/1') = true
system.type('Array').methodDictionary::copy:/1.isMethod = true
```
