# Record Constructor Syntax

Rewrite rules:

- _T(k: v, ...)_ ⟹ _T((k: v, ...))_

Uppercase unary functions may elide application parentheses when applied to records.

```
>>> Map(x: 1, y:2, z: 3)
Map['x' 1; 'y' 2; 'z' 3]
```

This allows something akin to keyword arguments.
For instance the SuperCollider unit generators each define a unary instances at `Record`:

```
SinOsc(freq: 440, phase: 0) * 0.1
```

* * *

See also: Dictionary, Record

Guides: Apply Syntax, List Constructor Syntax, Record Syntax, String Constructor Syntax

Categories: Syntax
