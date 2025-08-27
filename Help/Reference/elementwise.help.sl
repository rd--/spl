# elementwise

- _elementwise(aBlock:/1, x)_
- _elementwise(aBlock:/2, x, y)_
- _elementwise(aBlock:/3, x, y, z)_

Apply _aBlock_ elementwise recurively over the parameters.

Replace negative numbers with 0:

```
>>> max:/2.elementwise([1 -1 3 -4 5], 0)
[1 0 3 0 5]

>>> max:/2.elementwise(0, [1 -1 3 -4 5])
[1 0 3 0 5]
```

`max` in any case threads elementwise over lists:

```
>>> [1 -1 3 -4 5].max(0)
[1 0 3 0 5]
```

Find which elements of a list are less than one:

```
>>> <.elementwise([1 0 2 -1], 1)
[false true false true]
```

`<` in any case threads elementwise over lists:

```
>>> [1 0 2 -1] < 1
[false true false true]
```

Choose matrix elements that have the largest square:

```
>>> { :x :y |
>>> 	(x.square >= y.square).if {
>>> 		x
>>> 	} {
>>> 		y
>>> 	}
>>> }.elementwise(
>>> 	[-9 -5 -7; -2 -4 +1; -3 -8 -4],
>>> 	[-1 +2 -5; +5 -2 -3; +4 +6 +3]
>>> )
[-9 -5 -7; 5 -4 -3; 4 -8 -4]
```

If any of the lists contains sublists,
`elementwise` will thread as much as possible:

```
>>> { :x :y :z |
>>> 	['F' x y z].stringJoin
>>> }.elementwise(
>>> 	['A'; 'B'],
>>> 	[1 2],
>>> 	['X' 'Y']
>>> )
['FA1X'; 'FB2Y']
```

`elementwise` can thread with scalars:

```
>>> { :x :y :z |
>>> 	['F' x y z].stringJoin
>>> }.elementwise(['A' 'B'], 0, ['X' 'Y'])
['FA0X' 'FB0Y']
```

* * *

See also: adaptToCollectionAndApply, withCollect, withWithCollect

Guides: Elementwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Elementwise.html)
