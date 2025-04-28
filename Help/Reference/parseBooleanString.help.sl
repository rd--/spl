# parseBooleanString

- _parseBooleanString(aString)_

Answer the `Boolean` indicated by _aString_,
else signal an `error`.

```
>>> 'true'.parseBooleanString
true

>>> 'false'.parseBooleanString
false

>>> {
>>> 	'neither'.parseBooleanString
>>> }.ifError { true }
true
```

* * *

See also: isBooleanString, parseDecimalInteger, parseFraction, parseLargeInteger, parseNumber

Guides: Parsing Functions

Categories: Parsing
