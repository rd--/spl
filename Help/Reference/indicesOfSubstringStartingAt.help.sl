# indicesOfSubstringStartingAt

- _indicesOfSubstringStartingAt(u, v, n)_

Answer a `List`, possibly empty, of all the start indices of the sequence _v_,
as a contigusous subsequence,
in the sequence _u_, starting at index _n_.

The subsequence _23_ appears once in _123234345_ starting at three:

```
>>> let p = [1 2 3 2 3 4 3 4 5];
>>> let q = [2 3];
>>> p.indicesOfSubstringStartingAt(q, 3)
[4]
```

* * *

See also: indexOfSubstring, indicesOf, includesSubstring

Guides: List Functions

Categories: Indexing
