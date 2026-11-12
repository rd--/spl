# R

- _R(n, d)

Answer a rational number,
in Sᴘʟ called a `Fraction`,
with the indicated numerator _n_ and denominator _d_.
Alias for `Fraction`.
This mirrors the literal syntax.

At `SmallInteger` and Integer`:

```
>>> 3.R(4)
3R4

>>> 3L.R(4L)
3R4
```

Threads over lists:

```
>>> [1 2 3].R(2)
[1/2 1/1 3/2]

>>> [1 2 3; 4 5 6].R(3)
[1/2 2/3 1/1; 4/3 5/3 2/1]
```

* * *

See also: Integer, Float, Fraction, L, F, J, /, divide

Guides: Fraction Functions, Fraction Syntax

Unicode: U+1D45F 𝑟 Mathematical Italic Small R,
U+1D445 𝑅 Mathematical Italic Capital R
