# parseLargeInteger

- _parseLargeInteger(aString)_

Answer the `LargeInteger` value of the decimal integer held in _aString_.

```
>>> '23'.parseLargeInteger
23

>>> '20880467999847912034355032910567'
>>> .parseLargeInteger
23L ^ 23
```

An `error` is signalled if the parse fails:

```
>>> {
>>> 	'2.3'.parseLargeInteger
>>> }.ifError { true }
true

>>> {
>>> 	'23X'.parseLargeInteger
>>> }.ifError { true }
true
```

* * *

See also: parseDecimal, parseFraction, parseNumber, parseSmallInteger

Categories: Parsing
