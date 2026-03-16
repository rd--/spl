# helpImageProgramDictionary

- _helpImageProgramDictionary(system)_

Answer a `Record` where the keys are help file topics,
and the values are lists of `HelpProgram` values.

```
>>> let d = system.helpImageProgramDictionary;
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

See also: helpImageIndex, helpImageProgramTable, HelpProgram

Guides: Help Files
