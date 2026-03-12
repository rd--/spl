# helpImageDictionary

- _helpImageDictionary(system)_

Answer a `Record` where the keys are reference help file identifiers,
and the values are lists of code block records.

```
>>> let d = system.helpImageDictionary;
>>> (d.size, d.typeOf, d['abs'].typeOf, d['abs'].elementType)
(1413, 'Record', 'List', 'Record')

>>> let d = system.splReferenceImageDictionary;
>>> let c = d.values.catenate;
>>> ['svg' 'png' 'oeis' 'set'].collect { :k |
>>> 	c.count { :x |
>>> 		x.at('attributes')
>>> 		.includesKey(k)
>>> 	}
>>> }
[4094 175 58 55]
```
