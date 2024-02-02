# combinationsAtATimeDo -- enumerating

- _combinationsAtATimeDo(aSequence, anInteger, aBlock:/1)_

Take the items in the _aSequence_, _anInteger_ at a time, and evaluate _aBlock:/1_ for each combination.
Hand in an array of elements of _aSequence_ as the block argument.
Each combination only occurs once, and order of the elements does not matter.
There are _aSequence.size.take(anInteger) combinations.
