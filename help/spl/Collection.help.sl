# Collection -- collection trait

_Collection_ is a trait holding behaviours common to collections.

```
system.traitDictionary['Collection'].isTrait = true
system.traitTypes('Collection').includes('Array') = true
```

- remove(self, oldObject): Remove oldObject from the receiver's elements. Answer oldObject unless no element is equal to oldObject, in which case, raise an error.

* * *

See also: _Dictionary_, _SequenceableCollection_
