# Method -- behaviour type

_Method_ is the type of the entries in the [Method Table].

Methods have the fields:

- _arity_: an integer indicating the required number of arguments
- _name_: a string
- _origin_: the name of the type or Trait where the method is defined
- _procedure_: the compiled implementation of the method
- _sourceCode_: the definition of the method string

The _methodDictionary_ is reflected in the _System_ type.

	system.methodDictionary.isDictionary = true
	system.methodDictionary.includesKey('collect') = true
	system.methodLookupAtType('collect', 2, 'Array').isMethod = true
	system.methodLookupAtType('collect', 2, 'Array').origin.name = 'ArrayedCollection'
	system.methodLookupAtType('collect', 2, 'Array').procedure . ([3, 4, 5], { :x | x * x }) = [9, 16, 25]
	collect([3, 4, 5], { :x | x * x }) = [9, 16, 25]
	system.methodLookupAtType('sum', 1, 'Array') == system.methodLookupAtType('sum', 1, 'Set')

* * *

See also: System, Trait, Type
