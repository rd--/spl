# helpImageDictionary

- _helpImageDictionary(system)_

Answer a `Record` where the keys are help file topics,
and the values are lists of `HelpProgram` values.

```
>>> let d = system.helpImageDictionary;
>>> (
>>> 	d.size,
>>> 	d.typeOf,
>>> 	d['abs'].typeOf,
>>> 	d['abs'].elementType,
>>> 	d['abs'].size
>>> )
(1415, 'Record', 'List', 'HelpProgram', 5)
```

* * *

See also: helpImageIndex, helpImageTable, HelpProgram

Guides: Help Files
