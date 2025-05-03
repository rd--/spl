# parseSchemaType

- _parseSchemaType(aString, schemaType)_
- _parseSchemaType(aString, schemaType, elseClause:/0)_

Parse the Schema type of the value at _aString_.

Parse a `Boolean` type:

```
>>> 'true'.parseSchemaType('Boolean')
true

>>> 'false'.parseSchemaType('Boolean')
false

>>> 'neither'
>>> .parseSchemaType('Boolean') { nil }
nil
```

Parse an `Integer` number type:

```
>>> '23'.parseSchemaType('Integer')
23
```

Parse a `Fraction` number type:

```
>>> '2/3'.parseSchemaType('Fraction')
2/3
```

Parse a `Complex` number type:

```
>>> '2J3'.parseSchemaType('Complex')
2J3

>>> '1.618J3.141'
>>> .parseSchemaType('Complex')
1.618J3.141
```

Parse a `Real` number type:

```
>>> '3.141'.parseSchemaType('Real')
3.141

>>> '23.0'.parseSchemaType('Real')
23.0
```

Parse a `Date` type:

```
>>> '2025-05-01'
>>> .parseSchemaType('Date')
Date([2025, 5, 1])
```

Parse a `DateAndTime` type:

```
>>> '2025-05-01T12:22:10.000+10:00'
>>> .parseSchemaType('DateAndTime')
DateAndTime([2025, 5, 1, 2, 22, 10])
```

Parse a `Duration` type:

```
>>> 'P3DT5H4M23S'
>>> .parseSchemaType('Duration')
Duration(277463)
```

Parse a `Time` type:

```
>>> '12:50:22'
>>> .parseSchemaType('Time')
Time(46222)
```

* * *

See also: inferSchemaType

Guides: Parsing Functions
