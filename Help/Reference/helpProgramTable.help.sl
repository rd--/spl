# helpProgramTable

- _helpProgramTable(system, f/1=⊤)_

Answer a two column table where the keys are help file topics,
and the values are `HelpProgram` objects.

Count help programs:

```
>>> system.helpProgramTable.size
5199
```

A selection predicate may be specified,
count programs that answer images:

```
>>> system.helpProgramTable(
>>> 	isImageProgram/1
>>> ).size
5058
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
[4854 204 1815]
```

* * *

See also: helpProgramDictionary, HelpProgram

Guides: Help Files
