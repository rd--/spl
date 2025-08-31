# Experimental Tree Syntax

Rewrite rule:

- _[p q r ...]_ ⟹ _[p, q, r, ...]_

Tree syntax is the recursive form of `Vector Syntax`.

Allows writing trees of literals or identifiers without comma separators.

This syntax interacts poorly with `At Syntax`,
particularly as presently implemented with regards white space.
The expression below, which would need to be parsed as a tree, instead parses already:

```
>>> [[1 2] [2]]
[2]

>>> [1 2] [2]
2
```

Literals:

~~~spl experimental
[1 [1 3 [1 3 5] 5] 5]
=> [1, [1, 3, [1, 3, 5], 5], 5]
~~~

Identifiers:

~~~spl experimental
let [x, y, z] = [1 3 5];
[x [x y [x y z] z] z]
=> [1, [1, 3, [1, 3, 5], 5], 5]
~~~

* * *

See also: Array Syntax, List Syntax, Vector Syntax

Categories: Syntax

Status: Disallowed, Experimental
