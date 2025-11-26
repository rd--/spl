# OeisEntry

- _OeisEntry(n)_

`OeisEntry` is a `Type` holding a reference to an entry in the On-Line Encyclopedia of Integer Sequences (OEIS).
_n_ is the entry identifier, either as an integer or an _A-_ string.

```
>>> OeisEntry(1).identifier
'A000001'
```

Read the `identifier`, `number`, `name`, `keywords`, `offset` and `data` fields:

~~~
>>> OeisEntry('A000001').then { :e |
>>> 	(
>>> 		e.identifier,
>>> 		e.number,
>>> 		e.name,
>>> 		e.keywords,
>>> 		e.offset,
>>> 		e.data.size
>>> 	)
>>> }
(
	'A000001',
	1,
	'Number of groups of order n.',
	['nonn' 'core' 'nice' 'hard'],
	0,
	94
)
~~~

Plot the `data` given in the OEIS entry proper:

~~~spl svg=A
OeisEntry('A000001').then { :e |
	e.data
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-A.svg)

Plot the `bFileData` given in B-file associated with the OEIS entry:

~~~spl svg=B
OeisEntry('A000001').then { :e |
	e.bFileData
	.first(250)
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-B.svg)

Entries are cached on construction,
and B-file data is fetched using `cachedFetch`:

```
>>> let a = OeisEntry('A000001');
>>> let b = OeisEntry('A000001');
>>> a == b
true
```

* * *

Guides: Integer Sequence Functions
