# UndefinedObject -- nil type

_UndefinedObject_ is the type of the value _nil_.

	nil.typeOf = 'UndefinedObject'
	system.typeDictionary['UndefinedObject'].methodDictionary.keys.includes('ifNil:/2') = true
	nil.respondsTo(ifNil:/2) = true
