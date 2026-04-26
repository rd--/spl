# helpProgramTable

- _helpProgramTable(system, f:/1=⊤)_

Answer a two column table where the keys are help file topics,
and the values are `HelpProgram` objects.

Count help programs:

```
>>> system.helpProgramTable.size
4881
```

A selection predicate may be specified,
count programs that answer images:

```
>>> system.helpProgramTable(
>>> 	isImageProgram:/1
>>> ).size
4741
```

Count entries with specific annotations:

```
>>> let t = system.helpProgramTable;
>>> ['svg' 'png' 'oeis'].collect { :k |
>>> 	t.count { :e |
>>> 		e[2].annotations
>>> 		.includesKey(k)
>>> 	}
>>> }
[4557 184 1743]
```

* * *

See also: helpProgramDictionary, HelpProgram

Guides: Help Files
