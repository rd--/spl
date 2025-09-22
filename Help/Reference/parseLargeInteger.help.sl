# parseLargeInteger

- _parseLargeInteger(aString)_
- _parseLargeInteger(aString, elseClause:/0)_

Answer the `LargeInteger` value of the decimal integer held in _aString_.
The parser allows, but does not require, a trailing upper case letter "L".

```
>>> '23L'.parseLargeInteger
23L

>>> '20880467999847912034355032910567'
>>> .parseLargeInteger
23L ^ 23
```

If the parse fails evaluate _elseClause_,
or signal an `error`:

```
>>> '2.3'.parseLargeInteger { nil }
nil

>>> {
>>> 	'23X'.parseLargeInteger
>>> }.hasError
true
```

* * *

See also: LargeInteger, parseDecimal, parseFraction, parseNumber, parseSmallInteger

Guides: Integer Functions, Parsing Functions

Categories: Parsing
