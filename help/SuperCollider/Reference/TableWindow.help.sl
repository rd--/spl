# TableWindow

_TableWindow(trig, dur, bufNum)_

- trig: initiate window read
- dur: duration of window, in seconds
- bufNum: table to read from

The program below constructs a half-sine table,
which is applied as a window (amplitude envelope) to a sine oscillator.

	let tbl = 0:511.collect { :each |
		(each / 512 * pi).sin
	}.asLocalBuf;
	let k = 7;
	let dur = 1 / k;
	let tr = TrigRoundRobin(k, Impulse(k, 0));
	let win = TableWindow(tr, dur, tbl);
	Splay(
		SinOsc(TExpRand(111, 555, tr), 0) * win / 3
	)

* * *

See also: BufFrames, BufRd, Line, TableRand
