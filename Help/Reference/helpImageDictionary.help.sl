# helpImageDictionary

- _helpImageDictionary(system)_

Answer a `Record` where the keys are help file topics,
and the values are lists of code block records.

```
>>> let d = system.helpImageDictionary;
>>> (
>>> 	d.size,
>>> 	d.typeOf,
>>> 	d['abs'].typeOf,
>>> 	d['abs'].elementType,
>>> 	d['abs'].size
>>> )
(1414, 'Record', 'List', 'Record', 5)
```

* * *

See also: helpImageIndex, helpImageTable

Guides: Help Files
