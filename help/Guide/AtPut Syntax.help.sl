# AtPut Syntax

Rewrite rule:

- _c[i] := v_ ⟹ _atPut(c, i, v)_
- _c[i, j] := v_ ⟹ _atPut(c, i, j, v)_
- _c[i, j, k] := v_ ⟹ _atPut(c, i, j, k, v)_

Syntax for the _atPut_ protocol.

At List:

```
>>> let list = [1 2 3 4 5 6];
>>> list[3] := -3;
>>> list
[1 2 -3 4 5 6]
```

At List of List:

```
>>> let matrix = [1 2; 3 4; 5 6];
>>> matrix[2, 2] := -4;
>>> matrix[3, 1] := -5;
>>> matrix
[1 2; 3 -4; -5 6]
```

* * *

See also: [At Syntax], [Quoted AtPut Syntax].

Categories: Syntax
