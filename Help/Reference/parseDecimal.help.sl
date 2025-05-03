# parseDecimal

- _parseDecimal(aString)_
- _parseDecimal(aString, elseClause:/0)_

Parse _aString_ as a `Decimal` value,
if the parse fails evaluate _elseClause_ or signal an `error`.

Without fractional part:

```
>>> '23D'.parseDecimal
23D
```

With fractional part:

```
>>> '3.1416D'.parseDecimal
3.1416D
```

With negative sign:

```
>>> '-0.85D'.parseDecimal
-0.85D

>>> '-3.14159D'.parseDecimal
-3.14159D
```

With large integer:

```
>>> '20880467999847912034355032910567D'
>>> .parseDecimal
23L ^ 23
```

The _D_ suffix is required:

```
>>> '23'.parseDecimal { nil }
nil

>>> {
>>> 	'23'.parseDecimal
>>> }.ifError { true }
true
```

* * *

See also: Decimal, parseDecimalInteger, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions
