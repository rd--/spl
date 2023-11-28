# ofSize -- instance creation

- _ofSize(aBlock:/1, anInteger)_
- _ofSize(aCollection, anInteger)_

In the first case, evaluate _aBlock(anInteger)_ to create a new collection of size _anInteger_,
with nil as every element.

In the second case ensure _aCollection_ has _anInteger_ places.
Any newly created places have nil as the element.
If the collection has as many or more places than requested, it is answered unchanged.

This method exists because for some collection types the species block may create an empty collection.

* * *

See also: new, newFrom, species
