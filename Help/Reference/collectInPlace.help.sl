# collectInPlace

- _collect!(c, f/1)_

Evaluate the block _f_ with each element of the collection _c_ as the argument.
Collect the resulting values into the collection _c_.
Answer `c`.

At `Record`:

```
>>> let c = (x: 1, y: 2, z: 3);
>>> let r = c.collect!(square/1);
>>> (c, c == r)
((x: 1, y: 4, z: 9), true)
```

At `List`:

```
>>> let c = [1 4 9];
>>> let r = c.collect!(sqrt/1);
>>> (c, c == r)
([1 2 3], true)
```

* * *

See also: collect, deepCollectInPlace

Guides: Dictionary Functions, List Functions

Categories: Enumerating
