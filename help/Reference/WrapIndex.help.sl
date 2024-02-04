# WrapIndex

Index into a table with a signal.

_WrapIndex(table, in)_

The input signal value is truncated to an integer value and used as an index into the table.
Out of range index values are wrapped cyclically to the valid range.

- table: an instance of FloatList or Signal.
- in: the input signal.

Indexing into a table:

```
let buf = [200 300 400 500 600 800].asLocalBuf;
SinOsc(WrapIndex(buf, MouseX(0, 6 * 3, 0, 0.1)), 0) * 0.1
```

* * *

See also: Index, Shaper

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/WrapIndex.html)
