# chunksOf

- _chunksOf(aList | aString, length)_

Split a `List` or 

Split a `List` of nine places into three parts of three places:

```
>>> [1 .. 9].chunksOf(3)
[1 2 3; 4 5 6; 7 8 9]
```

If there are too few places,
the last part will be briefer:

```
>>> [1 .. 11].chunksOf(4)
[1 2 3 4; 5 6 7 8; 9 10 11]
```

At the empty `List`:

```
>>> [].chunksOf(3)
[]
```

At the `alphabet`:

```
'english'.alphabet.join('').chunksOf(3)
['abc' 'def' 'ghi' 'jkl' 'mno' 'pqr' 'stu' 'vwx' 'yz']

* * *

See also: clump, copyFromTo
