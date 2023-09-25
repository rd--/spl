# new -- instance creation

- _new(aBlock, anObject)_ ⟹= _aBlock(anObject)_

Implements the Smalltalk idiom _aCollection.species.new(aSize)_.

	[].species = Array:/1
	[].species.new(3) = [nil, nil, nil]

* * *

See also: ofSize, newFrom, species
