# boxNotation

- _boxNotation(x, c=[◻◼])_

Answer a string having the _box notation_ of the object _x_.

At `BitSet`:

```
>>> BitSet([0 2 4 5 7 9 11], 12)
>>> .boxNotation
'◼◻◼◻◼◼◻◼◻◼◻◼'
```

At `ResidueSet`:

```
>>> ResidueSet([0 2 4 5 7 9 11], 12)
>>> .boxNotation
'◼◻◼◻◼◼◻◼◻◼◻◼'
```

At `List`:

```
>>> [1 0 1 0 1 1 0 1 0 1 0 1]
>>> .boxNotation
'◼◻◼◻◼◼◻◼◻◼◻◼'

>>> [1 0 1 0 1 1 0 1 0 1 0 1]
>>> .boxNotation(['·' '×'])
'×·×·××·×·×·×'
```

At matrix:

```
>>> [
>>> 	1 0 1 0 1 1;
>>> 	0 1 0 1 0 0
>>> ].boxNotation
[
	'◼◻◼◻◼◼'
	'◻◼◻◼◻◻'
]
```

* * *

See also: BitSet, List, ResidueSet

Guides: String Functions
