# Trailing Dictionary Syntax

Rewrite rules:

- _f(k: v, ...)_ ⟹ _f((k: v, ...))_
- _x.f(k: v, ...)_ ⟹ _f(x, (k: v, ...))_

Trailing dictionary syntax allows for a single concluding _literal dictionary_ argument to be written as

1. the only parameter in an `Apply Syntax` expression
2. the second parameter of a `Method Syntax` expression

The first form can be used to implement something akin to keyword arguments.
For instance the SuperCollider unit generators each define a unary instances at `Record`:

```
SinOsc(freq: 440, phase: 0) * 0.1
```

The second form allows eliding double parentheses:

```
>>> let r = (w: 1, x: 2);
>>> r.addAll(y: 3, z: 4);
>>> r
(w: 1, x: 2, y: 3, z: 4)
```

* * *

See also: Dictionary, Record

Guides: Apply Syntax, Method Syntax, Trailing Block Syntax

Categories: Syntax
