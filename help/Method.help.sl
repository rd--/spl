# Method -- behaviour

_Method_ is the type of the entries in the _methodTable_.

Methods have the fields: _arity_, _name_, _origin_, _procedure_ and _sourceCode_.

```
system.method('collect', 2, 'Array').isMethod = true
system.method('collect', 2, 'Array').origin = 'ArrayedCollection'
system.method('collect', 2, 'Array').procedure . ([3, 4, 5], { :x | x * x }) = [9, 16, 25]
collect([3, 4, 5], { :x | x * x }) = [9, 16, 25]
system.method('sum', 1, 'Array') == system.method('sum', 1, 'OrderedCollection')
```
