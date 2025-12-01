# replace

- _replace(c, f:/1)_

Evaluate the block _f_ with each element of the collection _c_ as the argument.
Collect the resulting values into the collection _c_.

At `Record`:

```
>>> let c = (x: 1, y: 2, z: 3);
>>> c.replace(square:/1);
>>> c
(x: 1, y: 4, z: 9)
```

At `List`:

```
>>> let c = [1 4 9];
>>> c.replace(sqrt:/1);
>>> c
[1 2 3]
```

* * *

See also: collect, replaceWith

Guides: Dictionary Functions, List Functions

Categories: Enumerating
