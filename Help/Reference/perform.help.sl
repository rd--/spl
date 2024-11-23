# perform

- _perform(anObject, aString)_
- _perform(anObject, aString, anArgument)_

Look up a named method in the method table for the type of the receiver and apply it.

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

Categories: Reflection
