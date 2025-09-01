# withCollect

- _withCollect(c₁, c₂, f:/2)_

Collect and answer the result of evaluating the block _f_ with corresponding elements from each sequence _c_:

```
>>> 9:-1:1.withCollect(1:9) { :p :q |
>>> 	p * 2 + q
>>> }
[19 .. 11]
```

There are variant forms with distinct rules for how to behave when the sequences are of different lengths.

`withCollect` is equal to `withCollectWrapping`, which indexes the shorter sequence using `atWrap`:

```
>>> [1 2 3 4].withCollect([5 6 7 8 9], *)
[5 12 21 32 9]
```

`withCollectFolding` indexes the shorter sequence using `atFold`:

```
>>> [1 2 3 4].withCollectFolding(
>>> 	[5 6 7 8 9],
>>> 	*
>>> )
[5 12 21 32 27]
```

`withCollectTruncating` stops at the end of the shorter sequence:

```
>>> [1 2 3].withCollectTruncating(
>>> 	[4 5 6 7],
>>> 	*
>>> )
[4 10 18]
```

`withCollectEqual` signals an `error` if the sequenes are not of equal size:

```
>>> {
>>> 	[1 2 3].withCollectEqual(
>>> 		[4 5 6 7],
>>> 		*
>>> 	)
>>> }.ifError { true }
true
```

* * *

See also: adaptToCollectionAndApply, collect, map, table, withCollectEqual, withCollectFolding, withCollectTruncating, withCollectWrapping, withIndexCollect, withReplace, withWithCollect

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:zipWith),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MapThread.html)

Categories: Enumerating
