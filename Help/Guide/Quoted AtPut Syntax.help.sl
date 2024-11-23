# Quoted AtPut Syntax

Rewrite rule:

- _c::k := v_ ⟹ _atPut(c, 'k', v)_

Syntax for the _atPut_ protocol.
_c::k := v_ sets the value of the key _'k'_ at the collection _c_ to the value _v_.

```
>>> let d = (w: (x: (y: (z: 1))));
>>> d::w::x::y::z := -1;
>>> d
(w: (x: (y: (z: -1))))
```

Where supported _::_ is displayed as _·_.

* * *

See also: At Syntax, AtPut Syntax, Quoted At Syntax

Unicode: U+00B7 · Middle Dot

Categories: Syntax
