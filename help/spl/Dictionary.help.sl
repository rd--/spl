# Dictionary -- collection trait & type

_Dictionary_ is a trait holding behaviours common to collections of (key, value) associations.

```
system.traitTypes('Dictionary').includes('Dictionary') = true
system.traitDictionary['Dictionary'].isTrait = true
```

_Dictionary_ is a type where the keys are compared using the identity (==) operator.

- _Dictionary()_
- _Dictionary(anArray)_
- _Dictionary(aStringDictionary)_

Construct an empty _Dictionary_.

Construct an _Dictionary_ from an array of associations, or from a string dictionary.

* * *

See also: _Array_, _Association_, _StringDictionary_
