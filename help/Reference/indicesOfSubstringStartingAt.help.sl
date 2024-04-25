# indicesOfSubstringStartingAt

- _indicesOfSubstringStartingAt(aSequence, anotherSequence, anInteger)_

Answer a `List`, possibly empty, of all the start indices of _anotherSequence_,
as a contigusous subsequence,
in _aSequence_, starting at _anInteger_.

The subsequence _23_ appears once in _123234345_ starting at three:

```
>>> let p = [1 2 3 2 3 4 3 4 5];
>>> let q = [2 3];
>>> p.indicesOfSubstringStartingAt(q, 3)
[4]
```

* * *

See also: indexOfSubstring, indicesOf, includesSubstring

Categories: Indexing
