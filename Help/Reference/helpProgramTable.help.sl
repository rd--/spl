# helpProgramTable

- _helpProgramTable(system, f/1=⊤)_

Answer a two column table where the keys are help file topics,
and the values are `HelpProgram` objects.

Count help programs:

```
>>> system.helpProgramTable
>>> .size.round(25)
5800
```

A selection predicate may be specified,
count programs that answer images:

```
>>> system.helpProgramTable(
>>> 	isImageProgram/1
>>> ).size.round(25)
5075
```

Count synthesiser programs:

```
>>> system.helpProgramTable { :p |
>>> 	p.hasAnnotation('syn')
>>> }.size.round(25)
575
```

Count entries with specific annotations,
here vector graphic programs,
discrete graphsic programs,
synthesiser programs,
and integer sequence programs:

```
>>> let t = system.helpProgramTable;
>>> ['svg' 'png' 'syn' 'oeis'].collect { :k |
>>> 	t.count { :e |
>>> 		e[2].annotations
>>> 		.includesKey(k)
>>> 	}.round(25)
>>> }
[4875 200 575 1825]
```

* * *

See also: HelpProgram, helpProgramDictionary

Guides: Help Files
