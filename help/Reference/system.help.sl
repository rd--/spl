# system -- reflection

_system_ is the name of the singular instance of the _System_ type.

	system.methodDictionary.keys.includes('sum') = true
	system.traitDictionary.keys.includes('Collection') = true
	system.typeDictionary.keys.includes('List') = true

It holds the Method, Trait and Type dictionaries.

	system.methodDictionary.size >= 600
	system.traitDictionary.size >= 10
	system.typeDictionary.size >= 40

* * *

See also: System
