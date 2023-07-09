# Nil -- nil type

_Nil_ is the type of the value _nil_.

	nil.typeOf = 'Nil'
	system.typeDictionary['Nil'].methodDictionary.keys.includes('ifNil:/2') = true
	nil.respondsTo(ifNil:/2) = true

* * *

See also: nil, Void
