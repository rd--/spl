# parseLargeInteger

- _parseLargeInteger(aString)_

Answer the `LargeInteger` value of the decimal integer held in _aString_.
The parse allows, but does not require, a trailing upper case letter "L".

```
>>> '23L'.parseLargeInteger
23L

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

See also: LargeInteger, parseDecimal, parseFraction, parseNumber, parseSmallInteger

Guides: Parsing Functions

Categories: Parsing
