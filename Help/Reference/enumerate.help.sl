# enumerate

- _enumerate(s)_

Return a sequence like _s_ that enumerates the items of the input sequence _s_,
which may be a sequence or a stream,
along with an index.

At `List`:

```
>>> ['Spring' 'Summer' 'Fall' 'Winter']
>>> .enumerate
[
	1 'Spring';
	2 'Summer';
	3 'Fall';
	4 'Winter'
]
```

At `Sfc32`, which implements `Stream`,
the `next` method at the answer will answer a counter and the next item of the input:

```
>>> Sfc32(789142).enumerate.next!(5)
[
	1 0.15164;
	2 0.73129;
	3 0.14030;
	4 0.82076;
	5 0.98640
]
```

* * *

See also: BlockStream, Iterable, Iterator, Sequence

Guides: List Functions

References:
_Python_
[1](https://docs.python.org/3/library/functions.html#enumerate)

Categories: Enumerating
