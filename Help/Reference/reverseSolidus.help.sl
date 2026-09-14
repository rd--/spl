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

At `LargeInteger` answers a `Fraction`,
even if the `denominator` is `one`:

```
>>> let a = 3L;
>>> let b = 4L;
>>> (a \ b, a / b)
(3/4, 3/4)

>>> let a = 12L;
>>> let b = 4L;
>>> let c = a \ b;
>>> let d = a / b;
>>> (c, c.isFraction, d, d.isFraction)
(3/1, true, 3L, false)
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
In Sᴘʟ set difference is written as `difference`,
displayed as ∖,
or `complement`,
displayed as ∁.
`quotient` is written as `\\`,
displayed as ⑊,
which is symmetrical with `remainder`,
which is written `//`,
and displayed as ⫽.

* * *

See also: Fraction

Guides: Fraction Syntax, Numeric Types

References:
_W_
[1](https://en.wikipedia.org/wiki/Fraction)
[2](https://en.wikipedia.org/wiki/Ratio)

Categories: Math
