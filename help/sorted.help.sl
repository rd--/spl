# sorted -- sorting

- _sorted(aCollection)_
- _sorted(aCollection, aSortBlock)_

Answers a new sequenceable collection which contains the same elements as _aCollection_ but its elements are sorted by _aSortBlock_.
The block should take two arguments and answer true if the first element should preceed the second one.

The unary form sorts using the <=.

* * *

See also: _sortInPlace_
