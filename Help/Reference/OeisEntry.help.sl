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
>>> 		e.stableKeywords,
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

All of the `data` given in the OEIS entry proper,
OEIS [A000001](https://oeis.org/A000001):

~~~spl svg=A oeis=A000001
OeisEntry('A000001').then { :e |
	e.data
	.log
	.scatterPlot
}
~~~

![](Help/Image/OeisEntry-A.svg)

The first few items of `bFileData`,
as given in B-file associated with the OEIS entry,
OEIS [A000001](https://oeis.org/A000001):

~~~spl svg=B oeis=A000001
OeisEntry('A000001').then { :e |
	e.bFileData
	.first(250)
	.log
	.scatterPlot
}
~~~

![](Help/Image/OeisEntry-B.svg)

The first few items of `bFileData` for a sequence that is non-trivial to calculate,
OEIS [A059471](https://oeis.org/A059471):

~~~spl svg=C oeis=A059471
OeisEntry('A059471').then { :e |
	e.bFileData
	.first(125)
	.log
	.scatterPlot
}
~~~

![](Help/Image/OeisEntry-C.svg)

Limit of _f(f(f(...f(2)...)))%n_ as the number of iterations of _f(x)=2^x-1_ grows,
OEIS [A254410](https://oeis.org/A254410):

~~~spl svg=D oeis=A254410
OeisEntry('A254410').then { :e |
	e.bFileData
	.first(150)
	.scatterPlot
}
~~~

![](Help/Image/OeisEntry-D.svg)

The lexicographically earliest sequence of positive numbers which is identical to the run lengths of its first differences,
OEIS [A380317](https://oeis.org/A380317):

~~~spl svg=E oeis=A380317
OeisEntry('A380317').then { :e |
	e.bFileData
	.first(300)
	.linePlot
}
~~~

![](Help/Image/OeisEntry-E.svg)

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
[1](https://oeis.org)
[2](https://oeis.org/A000001)
[3](https://oeis.org/A059471)
[4](https://oeis.org/A254410),
_W_
[1](https://en.wikipedia.org/wiki/On-Line_Encyclopedia_of_Integer_Sequences)

Further Reading: Sloane 1973, Sloane 1995
