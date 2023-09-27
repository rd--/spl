# typeOf -- reflection

- _typeOf(anObject)_

Answers the type name of _anObject_.

	3.141.typeOf = 'SmallFloat'
	true.typeOf = 'Boolean'
	nil.typeOf = 'Nil'
	'x'.typeOf = 'String'
	[].typeOf = 'Array'
	().typeOf = 'Record'
	23.typeOf.typeOf = 'String'
	typeOf:/1.typeOf = 'Block'

The system includes a _typeDictionary_ that maps type names to _Type_ values.

	system.typeLookup('String').isType = true
	system.typeLookup('String').methodDictionary.includesKey('includesSubstring:/2') = true

* * *

See also: species, Type
