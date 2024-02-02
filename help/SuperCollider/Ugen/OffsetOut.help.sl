{----- Scheduling -----}

let ctl = (
	freq: 440,
	amp: 0.1,
	sustain: 1
).localControls;
let osc = SinOsc(ctl::freq, 0);
let env = Sine(1, ctl::sustain).FreeSelfWhenDone;
UgenGraph('sin', OffsetOut(0, osc * env * ctl::amp)).send

let freq = 555;
LsBind(
	instrument: 'sin',
	freq: freq,
	dur: 10 / freq,
	sustain: 20 / freq
).play
