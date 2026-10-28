# bufIndexClip

- _bufIndexClip(table, in)_

Index into a table with a signal.
The input signal value is truncated to an integer value and used as an index into the table.
Out of range index values are clipped to the valid range.

- table: a buffer
- in: the input signal

Index buffer for frequency values:

```
let f = bufIndexClip(
	LocalBuf[50 100 200 400 800 1600],
	linLin(LfSaw(2, 0), -1, 1, 0, 6)
);
SinOsc([f, f * 9], 0) * 0.1
```

* * *

See also: BufRd, Shaper, bufIndexWrap

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Index.html)

Categories: Ugen
