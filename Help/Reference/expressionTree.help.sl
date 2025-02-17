# expressionTree

- _expressionTree(aList)_
- _expressionTree(aList, anObject)_

Answer a `Tree` representation of a (possibly) nested `List`.

In the binary case,
_anObject_ is assigned as the value of each inner node:

```
>>> [1 2].expressionTree(nil)
Tree(nil, [Tree(1, []), Tree(2, [])])

>>> [1, [2, [3], 4], 5].expressionTree(nil)
Tree(
	nil,
	[
		Tree(1, []),
		Tree(
			nil,
			[
				Tree(2, []),
				Tree(
					nil,
					[
						Tree(3, [])
					]
				),
				Tree(4, [])
			]
		),
		Tree(5, [])
	]
)
```

In the unary case,
the first item in each list is taken as the value of the inner node and the remaining items as the subtrees.

```
>>> ['a', 1, 2].expressionTree
Tree('a', [Tree(1, []), Tree(2, [])])

>>> ['a', 1, ['b', 2, ['c', 3], 4], 5]
>>> .expressionTree
Tree(
	'a',
	[
		Tree(1, []),
		Tree(
			'b',
			[
				Tree(2, []),
				Tree(
					'c',
					[
						Tree(3, [])
					]
				),
				Tree(4, [])
			]
		),
		Tree(5, [])
	]
)
```

In both cases,
`asList` is the inverse:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .asList
[1, [2, [3], 4], 5]

>>> ['a', 1, ['b', 2, ['c', 3], 4], 5]
>>> .expressionTree
>>> .asList
['a', 1, ['b', 2, ['c', 3], 4], 5]
```

* * *

See also: asList, rulesTree, Tree

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExpressionTree.html)

Categories: Converting
