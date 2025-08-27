# replace

- _replace(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each element of _aCollection_ as the argument.
Collect the resulting values into _aCollection_.

At `Record`:

```
>>> let d = (x: 1, y: 2, z: 3);
>>> d.replace(square:/1);
>>> d
(x: 1, y: 4, z: 9)
```

At `List`:

```
>>> let l = [1 4 9];
>>> l.replace(sqrt:/1);
>>> l
[1 2 3]
```

* * *

See also: collect, replaceWith

Categories: Enumerating
