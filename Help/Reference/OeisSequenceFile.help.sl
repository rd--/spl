# OeisSequenceFile

- _OeisSequenceFile(n)_

Read a local copy of an Oeis sequence file.
The file is looked for at the director specified by the environment variable _OEIS_DATA_.
The sequence file is named according to the structure given by the archive at
[OeisData](https://github.com/oeis/oeisdata).

Read local Oeis sequence file and collect the `identifier`, `name`, `offset`, `data`, `keywords` and `author` fields:

```
>>> let o = OeisSequenceFile('A010926');
>>> (
>>> 	o.identifier,
>>> 	o.number,
>>> 	o.name,
>>> 	o.offset,
>>> 	o.data,
>>> 	o.keywords,
>>> 	o.author
>>> )
(
	'A010926',
	10926,
	'Binomial coefficients C(10,n).',
	[0, 2],
	[1, 10, 45, 120, 210, 252, 210, 120, 45, 10, 1],
	['nonn', 'fini', 'full', 'easy'],
	'_N. J. A. Sloane_'
)
```

Write summary record:

~~~spl io
FilePath('/tmp/splOeisReferences.json')
.writeTextFile(
	system
	.splOeisReferences
	.values
	.catenate
	.unique
	.collect { :n |
		let o = OeisSequenceFile(n);
		n -> (
			identifier: o.identifier,
			name: o.name,
			offset: o.offset,
			data: o.data,
			keywords: o.keywords,
			author: o.author
		)
	}.Record.encodeJson
)
~~~

* * *

See also: OeisEntry

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/eishelp1.html)
