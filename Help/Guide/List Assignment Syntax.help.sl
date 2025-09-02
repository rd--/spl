# List Assignment Syntax

There is a list assignment syntax for both temporary variable initialisers:

```
>>> let [x, y, z] = [1 * 2, 3 * 4, 5 * 6];
>>> [z, y, x]
[30, 12, 2]
```

and for variable assignment:

```
>>> let [x, y] = [0, 0];
>>> [x, y] := [1 * 2, 3 * 4];
>>> [y, x]
[12, 2]
```

Note that where in sequential assignment, evaluation and assignment are interleaved:

```
>>> let x = 1;
>>> let y = 2;
>>> x := y + 1;
>>> y := x * 2;
>>> [x, y]
[3, 6]
```

in list assignment the right hand side expression is evaluated before any assignments are made:

```
>>> let [x, y] = [1, 2];
>>> [x, y] := [y + 1, x * 2];
>>> [x, y]
[3, 2]
```

This latter form can significantly reduce the need for declared temporaries in expressions that update a set of inter-related variables, c.f. the list case:

```
>>> let [x, y, z] = [1, 2, 3];
>>> [x, y, z] := [x * y + z, x + y * z, x + y + z];
>>> [x, y, z]
[5, 9, 6]
```

and the equivalent interleaved case:

```
>>> let x = 1;
>>> let y = 2;
>>> let z = 3;
>>> x := x * y + z;
>>> y := x + y * z;
>>> z := x + y + z;
>>> [x, y, z]
[5, 21, 29]
```

or with temporary variables:

```
>>> var x, y, z, x1, y1, z1;
>>> x := 1;
>>> y := 2;
>>> z := 3;
>>> x1 := x * y + z;
>>> y1 := x + y * z;
>>> z1 := x + y + z;
>>> x := x1;
>>> y := y1;
>>> z := z1;
>>> [x, y, z]
[5, 9, 6]
```

* * *

See also: :=, List

Guides: Record Assignment Syntax

Categories: Syntax
