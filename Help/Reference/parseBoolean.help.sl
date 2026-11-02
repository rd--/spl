# parseBoolean

- _parseBoolean(s, f/0)_

Answer the `Boolean` indicated by the string _s_,
else evaluate the else clause _f_,
or signal an `error`.

Parse boolean texts:

```
>>> 'true'.parseBoolean
true

>>> 'false'.parseBoolean
false
```

At any other text:

```
>>> 'neither'.parseBoolean { nil }
nil

>>> {
>>> 	'neither'.parseBoolean
>>> }.hasError
true
```

* * *

See also: Boolean, isBooleanString, parseDecimalInteger, parseFraction, parseLargeInteger, parseNumber

Guides: Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Boolean_data_type)
