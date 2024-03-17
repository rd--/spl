# methodDictionary

- _methodDictionary(aSystem | aType)_

Fetch the `Method Dictionary` of the `System` or of a `Type`.

```
>>> [1 2 3].type.methodDictionary.isDictionary
true

>>> 'text'.type.methodDictionary.size > 200
true

>>> system.methodDictionary.isDictionary
true

>>> system.methodDictionary::collect.isDictionary
true

>>> system.methodDictionary::collect[2].isDictionary
true

>>> system.methodDictionary::collect[2]::List.isMethod
true
```

* * *

See also: Method Dictionary, System

Categories: Reflection, System
