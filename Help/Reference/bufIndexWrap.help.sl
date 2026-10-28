# bufIndexWrap

- _bufIndexWrap(table, in)_

Index into a table with a signal.
The input signal value is truncated to an integer value and used as an index into the table.
out of range index values are wrapped cyclically to the valid range.

- table: a buffer
- in: the input signal

Indexing into a table:

```
let b = [
	200 300 400 500 600 800
].localBuf;
sinOsc(
	bufIndexWrap(
		b,
		mouseX(0, 6 * 3, 0, 0.1)
	),
	0
) * 0.1
```

* * *

See also: bufIndexClip, shaper

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/WrapIndex.html)

Categories: Ugen
