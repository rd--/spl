# drop

- _drop(aSequence, anInteger)_

Answer a copy of _aSequence_ without the first _anInteger_ places.

	[5 4 3 2 1].drop(3) = [2 1] -- 3 ↓ 5 4 3 2 1 => 2 1

If _anInteger_ is negative, answer a copy of _aSequence_ without the last _anInteger_ places.

	[5 4 3 2 1].drop(-3) = [5 4] -- ¯3 ↓ 5 4 3 2 1 => 5 4

Removing more elements than the length of the sequence gives an empty result:

	[5 4 3 2 1].drop(-8) = [] -- ¯8 ↓ 5 4 3 2 1

* * *

See also: dropFirst, dropLast, take, <http://aplwiki.com/wiki/Drop>
