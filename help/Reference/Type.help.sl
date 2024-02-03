# Type

A _Type_ describes a kind of value.

The _system_ dictionary holds a _typeDictionary_.

	system.typeDictionary.isDictionary = true
	system.typeDictionary.includesKey('Array') = true
	system.typeLookup('Array').isType = true
	system.typeLookup('Array').name = 'Array'
	system.typeLookup('Array').methodDictionary.includesKey('shallowCopy:/1') = true
	system.typeLookup('Array').methodDictionary::shallowCopy:/1.isMethod = true

* * *

See also: Trait

Categories: Type
