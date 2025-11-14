# parseDecimal

- _parseDecimal(s, f:/0)_

Parse the string _s_ as a `Decimal` value,
if the parse fails evaluate the else clause _f_ or signal an `error`.

Without fractional part:

```
>>> '23D'.parseDecimal
23D

>>> Decimal(Fraction(23, 1E0), 0)
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

With scale specifier:

```
>>> '0.3D5'.parseDecimal
0.30000D

>>> '5D3'.parseDecimal
5.000D

>>> '3.141D3'.parseDecimal
3.141D
```

It is an error is the specified scale is less than the implicit scale:

```
>>> {
>>> 	'3.141D2'.parseDecimal
>>> }.hasError
true
```

The _D_ indicator is required:

```
>>> '23'.parseDecimal { nil }
nil

>>> {
>>> 	'3.141'.parseDecimal
>>> }.hasError
true
```

* * *

See also: Decimal, parseDecimalInteger, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions
