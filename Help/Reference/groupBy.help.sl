# groupBy

- _groupBy(c, f/1)_

Like in Sql answer the contents of the collection _c_ split into groups for which the key block _f_ returns the same results.
The answer is a `Map` keyed by the answers of _f_.

```
>>> [1 .. 5].groupBy(isEven/1)
Map[
	false -> [1 3 5],
	true -> [2 4]
]

>>> [1 .. 5].groupBy(isEven/1).keys
[false true]

>>> [1 .. 5].groupBy(isEven/1)[true]
[2 4]

>>> [
>>> 	'it' 'was' 'the' 'best' 'of' 'times'
>>> 	'it' 'was' 'the' 'worst' 'of' 'times'
>>> ].groupBy(size/1)
Map[
	2L -> ['it' 'of' 'it' 'of'],
	3L -> ['was' 'the' 'was' 'the'],
	4L -> ['best'],
	5L -> ['times' 'worst' 'times']
]
```

_Note_:
The Haskell `group` and `groupBy` functions are called `split` in Spl.

* * *

See also: countsBy, gatherBy, reject, select

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GroupBy.html)

Categories: Enumerating
