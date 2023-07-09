# allButFirst -- accessing

- _allButFirst(aSequencableCollection)
- _allButFirst(aSequencableCollection, anInteger)

Answer a copy of the receiver containing all but the first _anInteger_elements.
Raise an error if there are not enough elements.

	[1 .. 9].allButFirst(7) = [8, 9]
	'text'.allButFirst(3) = 't'

The unary form answers all but the first element.

	'text'.allButFirst = 'ext'
	[1 .. 9].allButFirst = [2 .. 9]

* * *

See also: allButLast
