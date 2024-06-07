# _

Low line (also called underscore or low dash) is a syntax token, it is not an operator.

A low line indicates unused variables in `List Assignment Syntax` and `Let Syntax`:

Skip over an element in a list:

```
>>> let [x, _, z] = [1 2 3];
>>> [x z]
[1 3]
```

Write a statement within in a `let` binding sequence:

```
>>> let x = 3;
>>> let _ = 5.timesRepeat { x := x * x };
>>> let y = x - 1;
>>> (x, y)
(1853020188851841, 1853020188851840)
```

* * *

See also: =, let

Guides: Let Syntax, List Assignment Syntax

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/colon.html)
