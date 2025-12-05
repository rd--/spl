# OeisEntry

- _OeisEntry(n)_

`OeisEntry` is a `Type` holding a reference to an entry in the On-Line Encyclopedia of Integer Sequences (OEIS).
_n_ is the entry identifier, either as an integer or an _A-_ string.

```
>>> OeisEntry(1).identifier
'A000001'
```

Read the `identifier`, `number`, `name`, `keywords`, `offset` and `data` fields:

```
>>> OeisEntry('A000001').then { :e |
>>> 	(
>>> 		e.identifier,
>>> 		e.number,
>>> 		e.name,
>>> 		e.keywords,
>>> 		e.offset,
>>> 		e.data.size,
>>> 		e.bFileData.size
>>> 	)
>>> }
(
	'A000001',
	1,
	'Number of groups of order n.',
	['nonn' 'core' 'nice' 'hard'],
	0,
	94,
	2048
)
```

Plot all of the `data` given in the OEIS entry proper:

~~~spl svg=A
OeisEntry('A000001').then { :e |
	e.data
	.log
	.scatterPlot
}
~~~

![](sw/spl/Help/Image/OeisEntry-A.svg)

Plot the first few items of `bFileData`,
as given in B-file associated with the OEIS entry:

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

See also: cachedFetch

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IntegerSequence.html),
_OEIS_
[1](https://oeis.org),
_W_
[1](https://en.wikipedia.org/wiki/On-Line_Encyclopedia_of_Integer_Sequences)

Further Reading: Sloane 1973, Sloane 1995
