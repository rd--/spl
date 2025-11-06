# Decimal Number Syntax

A `Decimal` is a real number specified to a fixed number of decimal places, called the _scale_.
Decimals may be written as literals using the syntax _rD_ or _rDs_.

Implicit scale:

```
>>> 3.4D
Decimal(34/10, 1)

>>> 23D
Decimal(23/1, 0)
```

Specified scale:

```
>>> 0.1D2
Decimal(1/10, 2)

>>> 0.1D2
0.10D

>>> 1D3
Decimal(1/1, 3)

>>> 1D3
1.000D
```

* * *

See also: Decimal

Guides: Number Syntax, Syntax Guides
