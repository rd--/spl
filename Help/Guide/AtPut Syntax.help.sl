# AtPut Syntax

Rewrite rule:

- _c[i] := x_ ⟹ _atPut(c, i, x)_
- _c[i, j] := x_ ⟹ _atPut(c, i, j, x)_
- _c[i, j, k] := x_ ⟹ _atPut(c, i, j, k, x)_

Syntax for the `atPut` protocol.

```
>> 'c[i] := x'.splSimplify
atPut(c, i, x)

>> 'c[i, j] := x'.splSimplify
atPut(c, i, j, x)

>> 'c[i, j, k] := x'.splSimplify
atPut(c, i, j, k, x)
```

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

Guides: At Syntax, Property Write Syntax, Syntax Guides

Categories: Syntax
