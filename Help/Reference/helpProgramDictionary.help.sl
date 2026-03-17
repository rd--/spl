# helpProgramDictionary

- _helpProgramDictionary(system, f:/1=⊤)_

Answer a `Record` where the keys are help file topics,
and the values are lists of `HelpProgram` values.

```
>>> let d = system.helpProgramDictionary;
>>> (
>>> 	d.size,
>>> 	d.typeOf,
>>> 	d['abs'].typeOf,
>>> 	d['abs'].elementType,
>>> 	d['abs'].size
>>> )
(1499, 'Record', 'List', 'HelpProgram', 5)
```

* * *

See also: helpProgramTable, HelpProgram

Guides: Help Files
