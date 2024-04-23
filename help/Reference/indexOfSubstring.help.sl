# indexOfSubstring

- _indexOfSubstring(aCollection, aSubstring)_

Answer the index of the first element of _aCollection_, where that element equals the first element of _aSubstring_,
and the next elements equal the rest of the elements of _aSubstring_.

```
>>> (1, 3 .. 9).indexOfSubstring([5 7 9])
3

>>> 1:9.indexOfSubstring([9])
9
```

If no such match is found, answer 0:

```
>>> 1:9.indexOfSubstring(3:11)
0
```

* * *

See also: indexOf, indexOfSubstringStartingAt

Categories: Accessing
