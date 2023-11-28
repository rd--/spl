# species -- reflection

- _species(anObject)_

Answers the primary factory method for the type of the receiver.

	[1 3 5].species = Array:/1
	[1 3 5].asBag.species = Bag:/0
	[1 3 5].asSet.species = Set:/0
	(x: 1, y: 3, z: 5).species = Record:/0

This is the mechanism by which trait methods can generate new values of the type of the receiver.

	[1 3 5].select { :x | x > 1 } = [3 5]
	[1 3 5].asSet.select { :x | x > 1 } = [3 5].asSet
	[1 3 5].asBag.select { :x | x > 1 } = [3 5].asBag
	(x: 1, y: 3, z: 5).select { :x | x > 1 } = (y: 3, z: 5)

* * *

See also: new, newFrom, ofSize, typeOf
