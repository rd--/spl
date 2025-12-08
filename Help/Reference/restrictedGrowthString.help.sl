# restrictedGrowthString

- _restrictedGrowthString(w)_

Answer the restricted growth string associated with the Dyck word _w_.

```
>>> 4.dyckWords.allSatisfy { :w |
>>> 	DyckWord(w)
>>> 	.restrictedGrowthString
>>> 	.isRestrictedGrowthString
>>> }
true
```

* * *

See also: DyckWord, restrictedGrowthStrings

Guides: Combinatorial Functions
