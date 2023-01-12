# Method -- behaviour type

_Method_ is the type of the entries in the [Method Table].

Methods have the fields:

- _arity_: an integer indicating the required number of arguments
- _name_: a string
- _origin_: the name of the type or Trait where the method is defined
- _procedure_: the compiled implementation of the method
- _sourceCode_: the definition of the method string

The _methodTable_ is stored in the _system_ dictionary.

```
system::methodTable.isIdentityDictionary = true
system::methodTable.includesKey('collect') = true
system.method('collect', 2, 'Array').isMethod = true
system.method('collect', 2, 'Array').origin = 'ArrayedCollection'
system.method('collect', 2, 'Array').procedure . ([3, 4, 5], { :x | x * x }) = [9, 16, 25]
collect([3, 4, 5], { :x | x * x }) = [9, 16, 25]
system.method('sum', 1, 'Array') == system.method('sum', 1, 'OrderedCollection')
```
