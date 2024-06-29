# Dictionary Syntax

Rewrite rule:

- _(k: v, ...)_ ⟹ _['k' → v, ...].asRecord_

The notation _(p: x, q: y)_ constructs a `Record` with associations _'p' → x_ and _'q' → y_.

```
>>> (p: 1, q: 2).associations
['p' -> 1, 'q' -> 2]
```

* * *

See also: :, Record

Guides: List Syntax, Quoted At Syntax, Quoted AtPut Syntax

Categories: Syntax
