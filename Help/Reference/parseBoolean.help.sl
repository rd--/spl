# parseBoolean

- _parseBoolean(aString)_

Answer the `Boolean` indicated by _aString_,
else signal an `error`.

```
>>> 'true'.parseBoolean
true

>>> 'false'.parseBoolean
false

>>> {
>>> 	'neither'.parseBoolean
>>> }.ifError { true }
true
```

* * *

See also: isBooleanString, parseDecimalInteger, parseFraction, parseLargeInteger, parseNumber

Guides: Parsing Functions

Categories: Parsing
