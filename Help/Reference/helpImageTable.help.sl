# helpImageTable

- _helpImageTable(system)_

Answer a two column table where the keys are help file topics,
and the values are code block records.

```
>>> system.helpImageTable.size
4279

>>> let t = system.helpImageTable;
>>> ['svg' 'png' 'oeis' 'set'].collect { :k |
>>> 	t.count { :e |
>>> 		e[2].at('attributes')
>>> 		.includesKey(k)
>>> 	}
>>> }
[4104 175 209 76]
```

* * *

See also: helpImageDictionary

Guides: Help Files
