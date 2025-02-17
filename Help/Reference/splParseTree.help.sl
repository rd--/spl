# splParseTree

- _splParseTree(aString)_

Answer a parse tree of the Spl expression at _aString_.

All expressions are represented by a `List`,
where the first entry is a `String` identifying the type of the expression,
and the remaining entries are the parts of the expression.

If the expression is an _identifier_,
the _type_ specifies the kind of identifier,
and there is one `String` part to the expression.

At program:

```
>>> 'x + y; z'.splParseTree
[
	'Program',
	[
		'Apply',
		['Operator', '+'],
		['Identifier', 'x'],
		['Identifier', 'y']
	],
	['Identifier', 'z']
]
```

Reserved identifiers:

```
>>> 'nil'.splParseTree[2]
['ReservedIdentifier', 'nil']

>>> 'true'.splParseTree[2]
['ReservedIdentifier', 'true']

>>> 'false'.splParseTree[2]
['ReservedIdentifier', 'false']
```

Operators:

```
>>> '+'.splParseTree[2]
['Operator', '+']

>>> '<=>'.splParseTree[2]
['Operator', '<=>']
```

Lower-case and upper-case initial identifiers:

```
>>> 'x'.splParseTree[2]
['Identifier', 'x']

>>> 'X'.splParseTree[2]
['Identifier', 'X']
```

At a `String` constant:

```
>>> '\'x\''.splParseTree[2]
['String', 'x']
```

At a `Number` constant:

```
>>> '23'.splParseTree[2]
['SmallInteger', '23']

>>> '-Infinity'.splParseTree[2]
['SmallFloat', '-Infinity']

>>> '3.141'.splParseTree[2]
['SmallFloat', '3.141']

>>> '23L'.splParseTree[2]
['LargeInteger', '23L']

>>> '2.3E1'.splParseTree[2]
['SmallFloat', '2.3E1']
```

At a `List` expression:

```
>>> '[1, 2, 3]'.splParseTree[2]
[
	'List',
	['SmallInteger', '1'],
	['SmallInteger', '2'],
	['SmallInteger', '3']
]

>>> '[[1, 2], [3, 4]]'.splParseTree[2]
[
	'List',
	[
		'List',
		['SmallInteger', '1'],
		['SmallInteger', '2']
	],
	[
		'List',
		['SmallInteger', '3'],
		['SmallInteger', '4']
	]
]
```

If the expression is an _assignment_,
the value is a two-`List` of the identifier that is assigned to,
and the parse tree of the assigned expression:

```
>>> 'x := x + 1'.splParseTree[2]
[
	'Assignment',
	['Identifier', 'x'],
	[
		'Apply',
		['Operator', '+'],
		['Identifier', 'x'],
		['SmallInteger', '1']
	]
]
```

If the expression is an _apply_ expression,
the value is a two-`List` of the identifier that is being applied,
and a `List` of the values it is applied to:

```
>>> 'f(x, y)'.splParseTree[2]
[
	'Apply',
	['Identifier', 'f'],
	['Identifier', 'x'],
	['Identifier', 'y']
]
```

Infix application is not recorded especially:

```
>>> 'x + y'.splParseTree[2]
[
	'Apply',
	['Operator', '+'],
	['Identifier', 'x'],
	['Identifier', 'y']
]
```

Dot application is not recorded especially:

```
>>> 'x.f(y)'.splParseTree[2]
[
	'Apply',
	['Identifier', 'f'],
	['Identifier', 'x'],
	['Identifier', 'y']
]
```

`Fraction` and `Complex` and `Residue` values are applications:

```
>>> '3/4'.splParseTree[2]
[
	'Apply',
	['Identifier', 'Fraction'],
	['LargeInteger', '3L'],
	['LargeInteger', '4L']
]

>>> '3J4'.splParseTree[2]
[
	'Apply',
	['Identifier', 'Complex'],
	['SmallInteger', '3'],
	['SmallInteger', '4']
]

>>> '3Z4'.splParseTree[2]
[
	'Apply',
	['Identifier', 'Residue'],
	['SmallInteger', '3'],
	['SmallInteger', '4']
]
```

If the expression is an _let_ expression,
the value is a two-`List` of the identifier that is being defined,
and the parse tree of the expression it is assigned to:

```
>>> 'let x = 2.pi; x; y'.splParseTree[2]
[
	'Let',
	['Identifier', 'x'],
	[
		'Apply',
		['Identifier', 'pi'],
		['SmallInteger', '2']
	]
]
```

If the expression is an _block_ expression,
the value is a `List` of,
in sequence,
any arguments,
any primitives,
any local variables, and
any statements:

```
>>> '{ }'.splParseTree[2]
['Block']

>>> '{ :x | x }'.splParseTree[2]
[
	'Block',
	['Arguments', ['Identifier', 'x']],
	['Identifier', 'x']
]

>>> '{ :x :y | let z = x * y; z}'.splParseTree[2]
[
	'Block',
	[
		'Arguments',
		['Identifier', 'x'],
		['Identifier', 'y']
	],
	[
		'Let',
		['Identifier', 'z'],
		[
			'Apply',
			['Operator', '*'],
			['Identifier', 'x'],
			['Identifier', 'y']
		]
	],
	['Identifier', 'z']
]
```

Control strucures are ordinary applications with block arguments:

```
>>> 'x.if { 1 } { 0 }'.splParseTree[2]
[
	'Apply',
	['Identifier', 'if'],
	['Identifier', 'x'],
	['Block', ['SmallInteger', '1']],
	['Block', ['SmallInteger', '0']]
]
```

* * *

See also: splParseExpression, splSimplify
