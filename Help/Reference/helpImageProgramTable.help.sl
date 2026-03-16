# helpImageTable

- _helpImageTable(system)_

Answer a two column table where the keys are help file topics,
and the values are code block records.

```
>>> system.helpImageTable.size
4286

>>> let t = system.helpImageTable;
>>> ['svg' 'png' 'oeis' 'set'].collect { :k |
>>> 	t.count { :e |
>>> 		e[2].annotations
>>> 		.includesKey(k)
>>> 	}
>>> }
[4116 175 1362 101]
```

* * *

See also: helpImageDictionary

Guides: Help Files
