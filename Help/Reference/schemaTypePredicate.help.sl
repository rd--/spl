# schemaTypePredicate

- _schemaTypePredicate(aString)_

Answer a predicate block to decide if a value is of the schema type specified at _aString_.

Predicate for `Boolean` type:

```
>>> 'Boolean'.schemaTypePredicate
isBoolean:/1
```

Predicate for `Integer` number type:

```
>>> 'Integer'.schemaTypePredicate
isInteger:/1
```

Predicate for `Fraction` number type:

```
>>> 'Fraction'.schemaTypePredicate
isFraction:/1
```

Predicate for `Complex` number type:

```
>>> 'Complex'.schemaTypePredicate
isComplex:/1
```

Predicate for `Real` number type:

```
>>> 'Real'.schemaTypePredicate
isSmallFloat:/1
```

Predicate for `Date` type:

```
>>> 'Date'.schemaTypePredicate
isDate:/1
```

Predicate for `DateAndTime` type:

```
>>> 'DateAndTime'.schemaTypePredicate
isDateAndTime:/1
```

Predicate for `Duration` type:

```
>>> 'Duration'.schemaTypePredicate
isDuration:/1
```

Predicate for `Time` type:

```
>>> 'Time'.schemaTypePredicate
isTime:/1
```

* * *

See also: inferSchemaType

Guides: Parsing Functions
