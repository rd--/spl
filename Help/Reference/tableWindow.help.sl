# tableWindow

- _tableWindow(trig, dur, bufNum)_

Read window from table.

- trig: initiate window read
- dur: duration of window, in seconds
- bufNum: table to read from

The program below constructs a half-sine table,
which is applied as a window (amplitude envelope) to a sine oscillator.

```
let tbl = 0:511.collect { :each |
	(each / 512 * 1.pi).sin
}.localBuf;
let k = 7;
let dur = 1 / k;
let tr = trigRoundRobin(k, impulse(k, 0));
let win = tableWindow(tr, dur, tbl);
splay(
	sinOsc(tExpRand(111, 555, tr), 0) * win / 3
)
```

* * *

See also: bufFrames, bufRd, line, tLine, tableRand

Categories: Ugen
