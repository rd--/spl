# isComplexString

- _isComplexString(aString)_

Answer true if _aString_ would be parsed as a `Complex` number by `parseComplex`.

```
>>> '3J4'.isComplexString
true

>>> '-3J4'.isComplexString
true
```

The real and imaginary parts may have fractional components:

```
>>> '3.141J4'.isComplexString
true

>>> '3.141J1.618'.isComplexString
true

>>> '2J3.141'.isComplexString
true
```

The sign must be at the real part:

```
>>> '3J-4'.isComplexString
false
```

The real and imaginary parts may not be elided:

```
>>> '3'.isComplexString
false

>>> 'J4'.isComplexString
false
```

The separator must be a capital _J_:

```
>>> '3j4'.isComplexString
false
```

* * *

See also: Complex, parseComplex

Guides: Parsing Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Complex_number)

Categories: Converting, Parsing
