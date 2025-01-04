# Trailing Dictionary Syntax

Rewrite rules:

- _f(k: v, ...)_ ⟹ _f((k: v, ...))_
- _x.f(k: v, ...)_ ⟹ _f(x, (k: v, ...))_

Trailing dictionary syntax allows any number of concluding _literal dictionary_ arguments to be written outside the parameter list.
This notation is particularly clear for methods that accept an _options_ dictionary.

The SuperCollider Ugen functions have unary instances at Record:

```
SinOsc(freq: 440, phase: 0) * 0.1
```

(w: 1, x: 2).++((y: 3, z: 4))

* * *

See also: Trailing Block Syntax

Categories: Syntax
