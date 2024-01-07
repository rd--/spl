# commercialAt -- graphics

- _aNumber @ anotherNumber_
- _p @ q_ ⟹ _commercialAt(p, q)_

This operator is the point constructor in Smalltalk.

	0@0 = Point(0,0)

_Rationale_:
This is not given the simpler name of _at_ since that is the name of the lookup and indexing method in Smalltalk, and has it's own syntax.

	let c = [1, 2, 3];  c.at(2) = c[2]
