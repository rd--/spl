# flattened

- _flattened(aSequence)_

Similar to _concatenation_ but removes all nesting.

	[1 [2 [3 [4 [5] 6] 7] 8] 9].flattened = [1 .. 9]

Strings are not flattened to sequences of characters.

	[1 [2 [3 ['45' 6] '78']] 9].flattened = [1 2 3 '45' 6 '78' 9]

* * *

See also: concatenation

Categories: Converting
