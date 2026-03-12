# helpImageTable

- _helpImageTable(system)_

Answer a two column table where the keys are help file topics,
and the values are code block records.

```
>>> system.helpImageTable.size
4269

>>> let t = system.helpImageTable;
>>> ['svg' 'png' 'oeis' 'set'].collect { :k |
>>> 	t.count { :e |
>>> 		e[2].at('attributes')
>>> 		.includesKey(k)
>>> 	}
>>> }
[4094 175 58 55]
```

* * *

See also: helpImageDictionary

Guides: Help Files
