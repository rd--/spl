# Record Syntax

- _(:)_
- _(k: v, …)_

The notation _(:)_ answers an empty `Record`
The notation _(p: x, q: y)_ constructs a `Record` with associations _'p' → x_ and _'q' → y_.

Rewrite rules:

```
>> '(:)'.splSimplify
Record()

>> '(p: 1, q: 2)'.splSimplify
Record([['p', 1], ['q', 2]])
```

List of associations:

```
>>> (p: 1, q: 2).associations
['p' -> 1, 'q' -> 2]
```

* * *

See also: :, Record

Guides: List Syntax, Property Read Syntax, Property Write Syntax

Categories: Syntax
