# Property Write Syntax

Rewrite rule:

- _r::p := x_ ⟹ _propertyWrite(r, 'p', x)_

_r::p := x_ sets the value of the property _'p'_ at the record _r_ to the value _x_.

```
>>> let d = (w: (x: (y: (z: 1))));
>>> d::w::x::y::z := -1;
>>> d
(w: (x: (y: (z: -1))))
```

Where supported _::_ is displayed as _·_.

* * *

See also: At Syntax, AtPut Syntax, Property Read Syntax, Property Syntax

Unicode: U+00B7 · Middle Dot

Categories: Syntax
