# Dictionary Syntax

Rewrite rule:

- _(k: v, ...)_ ⟹ _Record(['k' → v, ...])_

The notation _(p: x, q: y)_ constructs a `Record` with associations _'p' → x_ and _'q' → y_.

```
>>> (p: 1, q: 2).associations
['p' -> 1, 'q' -> 2]
```

* * *

See also: Initialised Temporaries Syntax, Quoted At Syntax, Quoted Put Syntax, Record

Categories: Syntax
