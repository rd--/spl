# indexOfSubstringStartingAt

- _indexOfSubstringStartingAt(aSequence, aSubstring, anIndex)_

Answer the index of the first element of _aSequence_, where that element equals the first element of _aSubstring_,
and the next elements equal the rest of the elements of _aSubstring_.
Begin the search at element _anIndex_ of _aSequence_.

```
>>> let p = (1, 3 .. 9);
>>> let q = [5 7 9];
>>> let i = p.indexOfSubstringStartingAt(q, 3);
>>> (p.includesSubstring(q), i)
(true, 3)
```

The search string may have only one place:

```
>>> let p = 1:9;
>>> let q = [9];
>>> p.indexOfSubstringStartingAt(q, 9)
9
```

If no such match is found, answer `zero`:

```
>>> let p = 1:9;
>>> let q = 3:5;
>>> p.indexOfSubstringStartingAt(q, 4)
0
```

* * *

See also: includesSubstring, indexOf, indexOfSubstring

References:
_Smalltalk_
5.7.8.22

Categories: Accessing
