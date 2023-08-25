# allButFirst -- accessing

- _allButFirst(aSequence)
- _allButFirst(aSequence, anInteger)

Answer a copy of _aSequence_ containing all but the first _anInteger_ elements.
Signal an error if there are not enough elements.

	[1 .. 9].allButFirst(7) = [8, 9]
	'text'.allButFirst(3) = 't'

The unary form answers all but the first element.

	'text'.allButFirst = 'ext'
	[1 .. 9].allButFirst = [2 .. 9]

* * *

See also: allButLast
