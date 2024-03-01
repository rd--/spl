# perform

- _perform(anObject, aString)_
- _perform(anObject, aString, anArgument)_

Look up a named method in the method table for the type of the receiver and apply it.

```
>>> (3 -> 2).perform('key')
3

>>> 3.perform('plusSign', 4)
7
```

* * *

See also: methodLookupAtType

Categories: Reflection
