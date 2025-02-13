# splParseTree

- _splParseTree(aString)_

Answer a parse tree of the Spl expression at _aString_.

All expressions have the form _[type, value]_,
where _type_ is a `String` identifying the type of the expression,
and value is a `List`.

If the expression is an _identifier_,
type _type_ specifies the kind of identifier,
and the _value_ is an enclosed `String`:

```
>>> 'nil'.splParseTree[2, 1]
['ReservedIdentifier', ['nil']]

>>> 'true'.splParseTree[2, 1]
['ReservedIdentifier', ['true']]

>>> 'false'.splParseTree[2, 1]
['ReservedIdentifier', ['false']]

>>> '+'.splParseTree[2, 1]
['Operator', ['+']]

>>> 'x'.splParseTree[2, 1]
['Identifier', ['x']]

>>> 'X'.splParseTree[2, 1]
['Identifier', ['X']]
```

If the expression is a _string_,
the _value_ is an enclosed `String`:

```
>>> '\'x\''.splParseTree[2, 1]
['String', ['x']]
```

If the expression is a _number_,
the _value_ an enclosed `String`:

```
>>> '23'.splParseTree[2, 1]
['SmallInteger', ['23']]

>>> '-Infinity'.splParseTree[2, 1]
['SmallFloat', ['-Infinity']]

>>> '3.141'.splParseTree[2, 1]
['SmallFloat', ['3.141']]

>>> '23L'.splParseTree[2, 1]
['LargeInteger', ['23L']]

>>> '2.3E1'.splParseTree[2, 1]
['SmallFloat', ['2.3E1']]
```

If the expression is a _list_,
the value is a `List` of the parse trees of the items:

```
>>> '[1, 2, 3]'.splParseTree[2, 1]
[
	'List',
	[
		['SmallInteger', ['1']],
		['SmallInteger', ['2']],
		['SmallInteger', ['3']]
	]
]

>>> '[[1, 2], [3, 4]]'.splParseTree[2, 1]
[
	'List',
	[
		[
			'List',
			[
				['SmallInteger', ['1']],
				['SmallInteger', ['2']]
			]
		],
		[
			'List',
			[
				['SmallInteger', ['3']],
				['SmallInteger', ['4']]
			]
		]
	]
]
```

If the expression is an _assignment_,
the value is a two-`List` of the identifier that is assigned to,
and the parse tree of the assigned expression:

```
>>> 'x := x + 1'.splParseTree[2, 1]
[
	'Assignment',
	[
		['Identifier', ['x']],
		[
			'Apply',
			[
				['Operator', ['+']],
				[
					['Identifier', ['x']],
					['SmallInteger', ['1']]
				]
			]
		]
	]
]
```

If the expression is an _apply_ expression,
the value is a two-`List` of the identifier that is being applied,
and a `List` of the values it is applied to:

```
>>> 'f(x, y)'.splParseTree[2, 1]
[
	'Apply',
	[
		['Identifier', ['f']],
		[
			['Identifier', ['x']],
			['Identifier', ['y']]
		]
	]
]

>>> '+(x, y)'.splParseTree[2, 1]
[
	'Apply',
	[
		['Operator', ['+']],
		[
			['Identifier', ['x']],
			['Identifier', ['y']]
		]
	]
]
```

Infix application is not recorded especially:

```
>>> 'x + y'.splParseTree[2, 1]
[
	'Apply',
	[
		['Operator', ['+']],
		[
			['Identifier', ['x']],
			['Identifier', ['y']]
		]
	]
]
```

Dot application is not recorded especially:

```
>>> 'x.f(y)'.splParseTree[2, 1]
[
	'Apply',
	[
		['Identifier', ['f']],
		[
			['Identifier', ['x']],
			['Identifier', ['y']]
		]
	]
]
```

`Fraction` and `Complex` and `Residue` values are applications:

```
>>> '3/4'.splParseTree[2, 1]
[
	'Apply',
	[
		['Identifier', ['Fraction']],
		[
			['LargeInteger', ['3L']],
			['LargeInteger', ['4L']]
		]
	]
]

>>> '3J4'.splParseTree[2, 1]
[
	'Apply',
	[
		['Identifier', ['Complex']],
		[
			['SmallInteger', ['3']],
			['SmallInteger', ['4']]
		]
	]
]

>>> '3Z4'.splParseTree[2, 1]
[
	'Apply',
	[
		['Identifier', ['Residue']],
		[
			['SmallInteger', ['3']],
			['SmallInteger', ['4']]
		]
	]
]
```

If the expression is an _let_ expression,
the value is a two-`List` of the identifier that is being defined,
and the parse tree of the expression it is assigned to:

```
>>> 'let x = 2.pi; x'.splParseTree[2, 1]
[
	'Let',
	[
		['Identifier', ['x']],
		[
			'Apply',
			[
				['Identifier', ['pi']],
				[
					['SmallInteger', ['2']]
				]
			]
		]
	]
]
```

If the expression is an _block_ expression,
the value is a `List` of,
in sequence,
any arguments,
any local variables, and
any statements:

```
>>> '{ }'.splParseTree[2, 1]
[
	'Block',
	[]
]

>>> '{ :x | x }'.splParseTree[2, 1]
[
	'Block',
	[
		['ArgumentList', ['x']],
		['Identifier', ['x']]
	]
]

>>> '{ :x :y | x * y}'.splParseTree[2, 1]
[
	'Block',
	[
		['ArgumentList', ['x', 'y']],
		['Apply',
			[
				['Operator', ['*']],
				[
					['Identifier', ['x']],
					['Identifier', ['y']]
				]
			]
		]
	]
]
```

Control strucures are ordinary applications with block arguments:

```
>>> 'x.if { 1 } { 0 }'.splParseTree[2, 1]
[
	'Apply',
	[
		['Identifier', ['if']],
		[
			['Identifier', ['x']],
			[
				'Block',
				[
					['SmallInteger', ['1']]
				]
			],
			[
				'Block',
				[
					['SmallInteger', ['0']]
				]
			]
		]
	]
]
```

* * *

See also: splSimplify
