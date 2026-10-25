# helpProgramDictionary

- _helpProgramDictionary(system, f/1=⊤)_

Answer a `Record` where the keys are help file topics,
and the values are lists of `HelpProgram` values.

```
>>> let d = system.helpProgramDictionary;
>>> (
>>> 	d.size.round(25),
>>> 	d.typeName,
>>> 	d['abs'].typeName,
>>> 	d['abs'].elementType,
>>> 	d['abs'].size
>>> )
(1650, 'Record', 'List', 'HelpProgram', 6)
```

* * *

See also: HelpProgram, helpProgramTable

Guides: Help Files
