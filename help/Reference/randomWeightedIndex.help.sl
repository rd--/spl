# randomWeightedIndex

_randomWeightedIndex(aSequence)_

Answer an index into _aSequence_, which is a sequence of numbers that sum to one.
The probablity of an index being drawn is given by the weight of that index in _aSequence_.

Plot one hundred draws, ~10% will be 1, ~60% will be 2, ~30% will be 3.

```
({ [0.1, 0.6, 0.3].randomWeightedIndex } ! 100).plot
```

* * *

See also: atRandom, nextRandomFloat
