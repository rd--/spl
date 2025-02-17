# rulesTree

- _rulesTree(anAssociation)_


Construct a `Tree` with three leaves:

```
>>> ('a' -> ['b' 'c' 'd']).rulesTree
Tree(
	'a',
	[
		Tree('b', []),
		Tree('c', []),
		Tree('d', [])
	]
)
```

Construct a tree with several levels:

```
>>> ('a' -> ['b' -> ['c', 'd'], 'e', 'f'])
>>> .rulesTree
Tree(
	'a',
	[
		Tree(
			'b',
			[
				Tree('c', []),
				Tree('d', [])
			]
		),
		Tree('e', []),
		Tree('f', [])
	]
)
```

Construct an inner node with no children:

```
>>> ('a' -> []).rulesTree
Tree('a', [])
```

Construct a tree of the House of Atreus:

~~~spl svg=A
(
	'Tantalus' -> [
		'Pelops' -> [
			'Thyestes' -> [
				'Aegisthus'
			],
			'Atreus' -> [
				'Menelaus',
				'Agamemnon' -> [
					'Iphigeneia',
					'Electra',
					'Orestes'
				]
			]
		]
	]
).rulesTree.asGraph.graphPlot
~~~

![](sw/spl/Help/Image/rulesTree-A.svg)

* * *

See also: Tree

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RulesTree.html)
