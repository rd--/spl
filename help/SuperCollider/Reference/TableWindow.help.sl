# TableWindow

_TableWindow(trig, dur, bufNum)_

- trig: initiate window read
- dur: duration of window, in seconds
- bufNum: table to read from

The program below constructs a half-sine table,
which is applied as a window (amplitude envelope) to a sine oscillator.

```
var tbl = (0 .. 511).collect { :each |
	(each / 512 * pi).sin
}.asLocalBuf;
var k = 7;
var dur = 1 / k;
var tr = TrigRoundRobin(k, Impulse(k, 0));
var win = TableWindow(tr, dur, tbl);
Splay(
	SinOsc(ExpRand(tr, 111, 555), 0) * win / 3
)
```

* * *

See also: BufFrames, BufRd, Line, TableRand
