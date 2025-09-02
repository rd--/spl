# >~ (greaterThanSignTilde)

- _p >~ q_

Answer `true` if _p_ is greater than or similar to _q_, else `false`.

```
>>> 3.1415 >~ 1.pi
true

>>> 3.1415 < 1.pi
true
```

Written out:

```
>>> let p = 3.1415;
>>> let q = 1.pi;
>>> p > q | { p ~ q }
true
```

The name of this operator is `greaterThanSignTilde`.

Where supported `>~` is displayed as ⪆.

* * *

See also: =, <=, >=, ~, <~

Guides: Comparison Functions

Unicode: U+2A86 ⪆ Greater-Than or Approximate, U+2A9E ⪞ Similar or Greater-Than

Categories: Comparing
