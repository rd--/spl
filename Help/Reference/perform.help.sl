# perform

- _perform(x, s)_
- _perform(x, s, y)_

Look up the named method _s_ in the method table for the type of the receiver _x_ and apply it.

Perform a named unary method, the name is given without the arity qualifier:

```
>>> (3 -> 2).perform('key')
3

>>> 3/2.perform('numerator')
3
```

Perform a named binary method, the name is given without the arity qualifier:

```
>>> 3.perform('min', 4)
3
```

Operator names must be given using the translated name:

```
>>> 3.perform('plusSign', 4)
7

>>> [1 2].perform('plusSignPlusSign', [3 4])
[1 2 3 4]
```

* * *

See also: methodLookupAtType, respondsTo

Guides: Reflection Functions

Categories: Reflection
