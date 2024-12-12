# parseFraction

- _parseFraction(aString, separator='/')_

Answer the `Fraction` represented by _aString_,
using _separator_ to delimit the numerator and denominator,
else signal an `error`.

Parse fraction written with a _solidus_ as separator:

```
>>> '3/4'.parseFraction('/')
3/4
```

The unary form sets the separator to '/':

```
>>> '9/8'.parseFraction
9/8
```

Signal an `error` if _aString_ is not a fraction:

```
>>> {
>>> 	'3.141'.parseFraction('/')
>>> }.ifError { true }
true
```

* * *

See also: parseInteger, parseNumber

Categories: Converting
