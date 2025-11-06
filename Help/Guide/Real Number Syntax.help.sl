# Real Number Syntax

Real numbers are ordinarily written in decimal notation and evaluate to floating point numbers.

```
>>> 3.141.typeOf
'SmallFloat'

>>> 3.0.typeOf
'SmallFloat'

>>> 3.typeOf
'SmallFloat'
```

Both positive and negative signs are allowed:

```
>>> -2.3.isNegative
true

>>> +2.3.isPositive
true

>>> +2 - -2
4

>>> -2 - +2
-4
```

Real numbers may also be written in `Scientific Notation`:

```
>>> 1E-2
0.01

>>> 2.3E3
2300
```

* * *

See also: SmallFloat

Guides: Number Syntax, Scientific Notation
