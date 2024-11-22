# Experimental Tree Syntax

Rewrite rule:

- _[p q r ...]_ ⟹ _[p, q, r, ...]_

Tree syntax is the recursive form of `Vector Syntax`.

Allows writing trees of literals or identifiers without comma separators.

Literals:

~~~
[1 [1 3 [1 3 5] 5] 5]
[1, [1, 3, [1, 3, 5], 5], 5]
~~~

Identifiers:

~~~
let [x, y, z] = [1 3 5];
[x [x y [x y z] z] z]

[1, [1, 3, [1, 3, 5], 5], 5]
~~~

* * *

See also: Array Syntax, List Syntax, Vector Syntax

Categories: Syntax
