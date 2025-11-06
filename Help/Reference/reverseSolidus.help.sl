# `\` (reverseSolidus)

- _n `\` d_

The operator form of `Fraction`.

At `SmallFloat`:

```
>>> let a = 3;
>>> let b = 4;
>>> (a \ b, a / b)
(3/4, 0.75)
```

At `LargeInteger`:

```
>>> let a = 3L;
>>> let b = 4L;
>>> (a \ b, a / b)
(3/4, 3/4)
```

With `List` operand:

```
>>> 1 \ [2 3 4]
[1/2 1/3 1/4]
```

At `List`:

```
>>> [1 2 3] \ [4 5 6]
[1/4 2/5 1/2]
```

The name of this operator is `reverseSolidus`.

_Rationale_:
This is a non-standard use of the reverse solidus symbol,
which is ordinarily used to denote both set difference (`complement`) and integer division (`quotient`).
In Sᴘʟ set difference is written as `difference` or `complement` which are displayed as ∖ and ∁ respectively,
and `quotient` is written as `\\` which is symmetrical with `remainder` which is written `//` displayed as ⫽.

* * *

See also: Fraction

Guides: Fraction Syntax, Numeric Types

Categories: Math
