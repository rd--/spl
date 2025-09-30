# indexOfSubstring

- _indexOfSubstring(u, v)_

Answer the index of the first element of the sequence _u_, where that element equals the first element of the substring _v_,
and the next elements equal the rest of the elements of _v_.

```
>>> (1, 3 .. 9).indexOfSubstring([5 7 9])
3
```

Index of one element substring:

```
>>> 1:9.indexOfSubstring([9])
9
```

At `String`:

```
>>> 'substring'.indexOfSubstring('string')
4
```

If no such match is found, answer 0:

```
>>> 1:9.indexOfSubstring(3:11)
0
```

With empty substring answers zero:

```
>>> 1:9.indexOfSubstring([])
0
```

* * *

See also: indexOf, indexOfSubstringStartingAt

Guides: List Functions

Categories: Accessing
