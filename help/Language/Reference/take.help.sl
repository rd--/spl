# take -- accessing

- _take(aCollection, maxNumberOfElements)_

Answer _maxNumberOfElements_ from _aCollection_ as a new collection (using _species_),
or less if _aCollection_ is not large enough.

- _take(anInteger, aSmallerInteger)_

Return the number of combinations of anInteger elements taken _aSmallerInteger_ at a time.
For 6 take 3, this is (6 * 5 * 4) / (1 * 2 * 3).
Zero outside of Pascals triangle.

- _take(aSequence, anInteger)_

Answer a copy of _aSequence_ with only the first _anInteger_ places.

	[5 4 3 2 1].take(3) = [5 4 3] -- 3 ↑ 5 4 3 2 1 => 5 4 3

If _anInteger_ is negative, answer a copy of _aSequence_ with only the last _anInteger_ places.

	[5 4 3 2 1].take(-3) = [3 2 1] -- ¯3 ↑ 5 4 3 2 1 => 3 2 1

Taking more elements than the length of the sequence fills the empty slots with _zero_ of the element type,
either as a suffix:

	[5 4 3 2 1].take(8) = [5 4 3 2 1 0 0 0] -- 8 ↑ 5 4 3 2 1 => 5 4 3 2 1 0 0 0

or as a prefix:

	[5 4 3 2 1].take(-8) = [0 0 0 5 4 3 2 1] -- ¯8 ↑ 5 4 3 2 1 => 0 0 0 5 4 3 2 1

* * *

See also: any, drop, <http://aplwiki.com/wiki/Drop>
