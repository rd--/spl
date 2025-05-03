# schemaTypeParser

- _schemaTypeParser(aString)_

Answer a parser block for the specified Schema type.

```
>>> 'Boolean'.schemaTypeParser
parseBoolean:/2

>>> 'Integer'.schemaTypeParser
parseDecimalInteger:/2

>>> 'Fraction'.schemaTypeParser
parseFraction:/2

>>> 'Complex'.schemaTypeParser
parseComplex:/2

>>> 'Real'.schemaTypeParser
parseNumber:/2

>>> 'Date'.schemaTypeParser
parseDate:/2

>>> 'DateAndTime'.schemaTypeParser
parseDateAndTime:/2

>>> 'Duration'.schemaTypeParser
parseDuration:/2

>>> 'Time'.schemaTypeParser
parseTime:/2
```

* * *

See also: inferSchemaType, parseSchemaType

Guides: Parsing Functions
