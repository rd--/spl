# AtPut Syntax

Rewrite rule:

- _c[i] := v_ ⟹ _atPut(c, i, v)_
- _c[i, j] := v_ ⟹ _atPut(c, i, j, v)_
- _c[i, j, k] := v_ ⟹ _atPut(c, i, j, k, v)_

Syntax for the `atPut` protocol.

At `List`:

```
>>> let x = [1 2 3 4 5 6];
>>> x[3] := -3;
>>> x
[1 2 -3 4 5 6]
```

At a list of lists:

```
>>> let x = [1 2; 3 4; 5 6];
>>> x[2, 2] := -4;
>>> x[3, 1] := -5;
>>> x
[1 2; 3 -4; -5 6]
```

* * *

See also: atPut

Guides: At Syntax, Quoted AtPut Syntax, Syntax Guides

Categories: Syntax
