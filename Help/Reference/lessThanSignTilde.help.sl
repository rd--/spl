# <~ (lessThanSignTilde)

- _p <~ q_

Answer `true` if _p_ is less than or similar to _q_, else `false`.

```
>>> 3.1416 <~ 1.pi
true

>>> 3.1416 > 1.pi
true
```

Written out:

```
>>> let p = 3.1416;
>>> let q = 1.pi;
>>> p < q | { p ~ q }
true
```

The name of this operator is `lessThanSignTilde`.

Where supported `<~` is displayed as ⪅.

* * *

See also: =, ~, <, >, >~

Guides: Comparison Functions

Unicode: U+2A85 ⪅ Less-Than or Approximate, U+2A9D ⪝ Similar or Less-Than

Categories: Comparing
