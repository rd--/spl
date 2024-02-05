# Vector Syntax

Rewrite rule:

- _[p q r ...]_ ⟹ _[p, q, r, ...]_

Allows writing lists where items are either literals or identifiers or _Vector Syntax_ without comma separators.

Literal items:

```
>>> [1 2 3 4 5 6 7 8 9]
[1, 2, 3, 4, 5, 6, 7, 8, 9]
```

Identifier items:

```
>>> let x = 1;
>>> let y = 2;
>>> [x y 3]
[1, 2, 3]
```

This is particularly useful as a part of [Matrix Syntax] and [Volume Syntax]

* * *

See also: [List Syntax], [Matrix Syntax], [Volume Syntax]

Categories: Syntax
