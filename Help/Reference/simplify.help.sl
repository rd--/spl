# simplify

- _simplify(x)_

Simplify the object _x_, there are copying and in-place forms.
Answer _x_.

In-place form at `Fraction`:

```
>>> let r = uncheckedFraction(2, 4);
>>> r.simplify!;
>>> r
1/2

>>> let r = uncheckedFraction(0, 4);
>>> r.simplify!;
>>> r
0/1

>>> let r = uncheckedFraction(16, 4);
>>> r.simplify!;
>>> r
4/1
```

Copying form at `Fraction`:

```
>>> let p = uncheckedFraction(2, 4);
>>> let q = p.simplify;
>>> (q, p != q)
(1/2, true)
```

* * *

See also: Fraction, normal, uncheckedFraction

Guides: Number Functions
