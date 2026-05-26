# foldPairList

- _foldPairList(f:/2, y, [x₁ x₂ …], g:/1)_

Answer the list of successive _x_ obtained by applying _f_ to pairs of the form _(y,x)_, where at each step _f_ returns _(x,y)_.

Break an amount of money into bills of given values:

```
>>> quotientRemainder:/2.foldPairList(
>>> 	498,
>>> 	[100 50 20 5 1]
>>> )
[4 1 2 1 3]
```

Return both the quotients and the remainders at each step:

```
>>> quotientRemainder:/2.foldPairList(
>>> 	498,
>>> 	[100 50 20 5 1],
>>> 	identity:/1
>>> )
[4 98; 1 48; 2 8; 1 3; 3 0]
```

For each element of a list, answer `true` if it is larger than all previous ones, and `false` otherwise:

```
>>> { :y :x |
>>> 	[x > y, y.max(x)]
>>> }.foldPairList(
>>> 	[1 1 2 5 2 2 9 1 2 11]
>>> )
[
	false true true false false
	true false false true
]
```

Find dimensions of an array up to level three:

```
>>> let a = [2 1 4 3].constantArray(0);
>>> { :y :x |
>>> 	[y.size, y.first]
>>> }.foldPairList(a, [1 2 3])
[2 1 4]
```

* * *

See also: collect, foldList, map, reduce, scan

Gudies: List Functions

References:
_Haskell_
[1](https://hackage-content.haskell.org/package/base-4.22.0.0/docs/Data-Traversable.html#v:mapAccumL),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FoldPairList.html)
