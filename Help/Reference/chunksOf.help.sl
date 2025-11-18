# chunksOf

- _chunksOf([x₁ x₂ …], n)_

Split a sequence _x_ into parts of length _n_ places.

Split a `List` of nine places into three parts of three places:

```
>>> 9.iota.chunksOf(3)
[
	1 2 3;
	4 5 6;
	7 8 9
]
```

If there are too few places,
the last part will be briefer:

```
>>> 11.iota.chunksOf(4)
[
	1 2 3 4;
	5 6 7 8;
	9 10 11
]
```

At the empty `List`:

```
>>> [].chunksOf(3)
[]
```

At the `alphabet`:

```
>>> 'english'
>>> .namedAlphabet
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

At `Range`:

```
>>> 1:9.chunksOf(3)
[1:3, 4:6, 7:9]
```

* * *

See also: chunksOfFrom, clump, copyFromTo, partition

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/split/docs/Data-List-Split.html#v:chunksOf)
