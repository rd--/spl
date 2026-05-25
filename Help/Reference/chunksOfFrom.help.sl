# chunksOfFrom

- _chunksOfFrom([x₁ x₂ …], n, m)_

Split a `List` or `String` into parts of length _n_ places starting at start index _m_.

Split a `List` of ten places into three parts of three places starting at index two:

```
>>> [1 .. 10].chunksOfFrom(3, 2)
[2 3 4; 5 6 7; 8 9 10]
```

If there are too few places,
the last part will be briefer:

```
>>> [1 .. 11].chunksOfFrom(4, 5)
[5 6 7 8; 9 10 11]
```

At the empty `List`:

```
>>> [].chunksOfFrom(3, 2)
[]
```

At the `alphabet`:

```
>>> 'english'
>>> .namedAlphabet
>>> .stringCatenate
>>> .chunksOfFrom(3, 10)
[
	'jkl' 'mno' 'pqr'
	'stu' 'vwx' 'yz'
]
```

* * *

See also: chunksOf, clump, copyFromTo
