# isSchemaType

- _isSchemaType(anObject, aString)_

A predicate to decide if _anObject_ is of the schema type specified at _aString_.

Predicate for `Boolean` type:

```
>>> true.isSchemaType('Boolean')
true

>>> false.isSchemaType('Boolean')
false
```

Predicate for `Integer` number type:

```
>>> 23.isSchemaType('Integer')
true
```

Predicate for `Fraction` number type:

```
>>> 2/3.isSchemaType('Fraction')
true
```

Predicate for `Complex` number type:

```
>>> 2J3.isSchemaType('Complex')
true

>>> 1.618J3.141.isSchemaType('Complex')
true
```

Predicate for `Real` number type:

```
>>> 3.141.isSchemaType('Real')
true

>>> 23.0.isSchemaType('Real')
true
```

Predicate for `Date` type:

```
>>> Date([2025, 5, 1])
>>> .isSchemaType('Date')
true
```

Predicate for `DateAndTime` type:

```
>>> DateAndTime([2025, 5, 1, 2, 22, 10])
>>> .isSchemaType('DateAndTime')
true
```

Predicate for `Duration` type:

```
>>> Duration(277463)
>>> .isSchemaType('Duration')
true
```

Predicate for `Time` type:

```
>>> Time(46222)
>>> .isSchemaType('Time')
true
```

* * *

See also: inferSchemaType

Guides: Parsing Functions
