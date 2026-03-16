# helpImageProgramTable

- _helpImageProgramTable(system)_

Answer a two column table where the keys are help file topics,
and the values are `HelpProgram` objects.

```
>>> system.helpImageProgramTable.size
4298

>>> let t = system.helpImageProgramTable;
>>> ['svg' 'png' 'oeis' 'set'].collect { :k |
>>> 	t.count { :e |
>>> 		e[2].annotations
>>> 		.includesKey(k)
>>> 	}
>>> }
[4120 178 1369 101]
```

* * *

See also: helpImageProgramDictionary, HelpProgram

Guides: Help Files
