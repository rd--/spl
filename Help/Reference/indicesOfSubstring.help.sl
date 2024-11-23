# indicesOfSubstring

- _indicesOfSubstring(aSequence, anotherSequence)_

Answer a `List`, possibly empty, of all the start indices of _anotherSequence_,
as a contigusous subsequence,
in _aSequence_.

The subsequence _345_ appears once in _123456789_:

```
>>> let p = 1:9;
>>> let q = 3:5;
>>> p.indicesOfSubstring(q)
[3]
```

The subsequence _23_ appears twice in _123234345_:

```
>>> let p = [1 2 3 2 3 4 3 4 5];
>>> let q = [2 3];
>>> p.indicesOfSubstring(q)
[2 4]
```

* * *

See also: indexOfSubstring, indicesOf, includesSubstring

Categories: Indexing
