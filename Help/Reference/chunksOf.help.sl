# chunksOf

- _chunksOf(aList | aString, length)_

Split a `List` or `String` into parts of _length_ places.

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
>>> 'english'
>>> .alphabet
>>> .stringJoin
>>> .chunksOf(3)
[
	'abc' 'def' 'ghi'
	'jkl' 'mno' 'pqr'
	'stu' 'vwx' 'yz'
]
```

Segment list of words:

```
>>> let l = [
>>> 	'roses' 'red'
>>> 	'violets' 'blue'
>>> 	'sugar' 'sweet'
>>> ];
>>> let a = l.chunksOf(2);
>>> let b = l.partition(2, 2);
>>> let c = l.clump(2);
>>> (a, a = b, a = c)
(
	[
		'roses' 'red';
		'violets' 'blue';
		'sugar' 'sweet'
	],
	true,
	true
)
```

* * *

See also: chunksOfFrom, clump, copyFromTo, partition

References:
_Haskell_
[1](https://hackage.haskell.org/package/split/docs/Data-List-Split.html#v:chunksOf)
