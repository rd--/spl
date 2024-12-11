# asLocalBuf

- _asLocalBuf(aList)_

Make a local buffer from a list or matrix of numbers.

```
let b = [
	0 2 3 5 7 8 10 12
].asLocalBuf;
let x = MouseX(0, 8, 0, 0.2);
let m = BufRd(1, b, x, 1, 1) + 48;
SinOsc(m.MidiCps, 0) * 0.1
```

In the matrix case the buffer will have multiple channels.

```
let b = [
	0 2 3 5;
	7 8 10 12
].asLocalBuf;
let x = MouseX(0, 4, 0, 0.2);
let m = BufRd(2, b, x, 1, 1) + 48;
SinOsc(m.MidiCps, 0) * 0.1
```

* * *

See also: ClearBuf, LocalBuf, SetBuf

Categories: Buffer
