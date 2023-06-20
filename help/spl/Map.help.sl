# Map -- collection type

_Map_ is a dictionary type where the keys are compared using the identity (==) operator.

- _Map()_
- _Map(anAssociationArray)_
- _Map(aRecord)_

Construct an empty _Map_.

	Map().isMap

Construct a _Map_ from an Array of associations, or from a Record.

	['x' -> 1, 'y' -> 2].Map.isMap
	(x: 1, y: 2).Map.isMap

* * *

See also: _Dictionary_, _Record_
