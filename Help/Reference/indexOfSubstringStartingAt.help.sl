# indexOfSubstringStartingAt

- _indexOfSubstringStartingAt(u, v, n)_

Answer the index of the first element of the sequence _u_, where that element equals the first element of the substring _v_,
and the next elements equal the rest of the elements of _v_.
Begin the search at element the index _n_ of _u_.

```
>>> let p = (1, 3 .. 9);
>>> let q = [5 7 9];
>>> let i = p.indexOfSubstringStartingAt(q, 3);
>>> (p.includesSubstring(q), i)
(true, 3)
```

At `String`:

```
>>> 'abcabcdabcde'
>>> .indexOfSubstringStartingAt('bc', 6)
9
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

Guides: List Functions, Sequence Alignment Functions

References:
_Smalltalk_
5.7.8.22

Categories: Accessing
