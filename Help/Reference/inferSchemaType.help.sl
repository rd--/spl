# inferSchemaType

- _inferSchemaType(aString)_

Infer the Schema type of the value at _aString_.

Infer a `Boolean` type:

```
>>> 'true'.inferSchemaType
'Boolean'

>>> 'false'.inferSchemaType
'Boolean'
```

Infer an `Integer` number type:

```
>>> '23'.inferSchemaType
'Integer'
```

Infer a `Fraction` number type:

```
>>> '2/3'.inferSchemaType
'Fraction'
```

Infer a `Complex` number type:

```
>>> '2J3'.inferSchemaType
'Complex'

>>> '1.618J3.141'.inferSchemaType
'Complex'
```

Infer a `Real` number type:

```
>>> '3.141'.inferSchemaType
'Real'

>>> '23.0'.inferSchemaType
'Real'

>>> '2E3'.inferSchemaType
'Real'
```

Infer a `Date` type:

```
>>> '2025-05-01'.inferSchemaType
'Date'
```

Infer a `DateAndTime` type:

```
>>> '2025-05-01T12:22:10.000+10:00'
>>> .inferSchemaType
'DateAndTime'
```

Infer a `Duration` type:

```
>>> 'P3DT5H4M23S'.inferSchemaType
'Duration'
```

Infer a `Time` type:

```
>>> '12:50:22'.inferSchemaType
'Time'
```

* * *

See also: parseSchemaType

Guides: Parsing Functions
