# parseSchemaType

- _parseSchemaType(aList, schemaType)_
- _parseSchemaType(aList, schemaType, elseClause:/0)_

Parse the list of `String` values at _aList_ according to the specified schema type.

Parse a `Boolean` type:

```
>>> ['true' 'false' 'neither' '']
>>> .parseSchemaType('Boolean') { nil }
[true false nil nil]
```

Parse an `Integer` number type:

```
>>> ['23' '23.0' '']
>>> .parseSchemaType('Integer') { nil }
[23 nil nil]
```

Parse a `Fraction` number type:

```
>>> ['2/3' '23' '2.3' '']
>>> .parseSchemaType('Fraction') { nil }
[2/3 23/1 nil nil]
```

Parse a `Complex` number type:

```
>>> ['2J3' '1.618J3.141' '2.3' '']
>>> .parseSchemaType('Complex') { nil }
[2J3 1.618J3.141 nil nil]
```

Parse a `Real` number type:

```
>>> ['3.141' '23.0' '23' '2/3' '']
>>> .parseSchemaType('Real') { nil }
[3.141 23.0 23 nil nil]
```

Parse a `Date` type:

```
>>> ['2025-05-01' '2025-05' '']
>>> .parseSchemaType('Date') { nil }
[Date([2025, 5, 1]), nil, nil]
```

Parse a `DateAndTime` type:

```
>>> [
>>> 	'2025-05-01T12:22:10.000+10:00'
>>> 	'2025-05-01'
>>> 	''
>>> ].parseSchemaType(
>>> 	'DateAndTime'
>>> ) { nil }
[
	DateAndTime([2025, 5, 1, 2, 22, 10]),
	nil,
	nil
]
```

Parse a `Duration` type:

```
>>> ['P3DT5H4M23S' '05:04:23']
>>> .parseSchemaType('Duration') { nil }
[Duration(277463), nil]
```

Parse a `Time` type:

```
>>> ['12:50:22' '12:50' '']
>>> .parseSchemaType('Time') { nil }
[Time(46222), nil, nil]
```

* * *

See also: inferSchemaType, schemaTypeParser

Guides: Parsing Functions
