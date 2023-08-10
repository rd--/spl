# Trait -- behaviour type

A _Trait_ is a named _Method_ dictionary.

The dictionary keys are _qualified_ method names, i.e. _sum:/1_.

	system.traitDictionary.isDictionary = true
	system.traitDictionary.includesKey('Collection') = true
	system.traitLookup('Collection').isTrait = true
	system.traitLookup('Collection').name = 'Collection'
	system.traitLookup('Iterable').methodDictionary.includesKey('sum:/1') = true
	system.traitLookup('Iterable').methodDictionary::sum:/1.isMethod = true
