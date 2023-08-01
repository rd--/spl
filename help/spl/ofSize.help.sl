# ofSize -- instance creation

- _ofSize(aCollection, anInteger)_

Ensure _aCollection_ has _anInteger_ places.
Any newly created places have nil as the element.
If the collection has more places than requested, it is answered unchanged.

- _ofSize(aProcedure, anInteger)_

Evaluate _aProcedure_ to create a new collection of size _anInteger_, with nil as every element.

This method exists because for some collection types the species procedure may create an empty collection.

* * *

See also: new, species

