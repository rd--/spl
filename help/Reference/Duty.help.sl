# Duty

Demand results from demand rate ugens.

_Duty(dur=1, reset=0, level=1)_

A value is demanded of _level_ and output according to a stream of duration values.

When there is a trigger at the reset input, _dur_ and _level_ are reset.

The reset input may also be a demand Ugen, providing a stream of reset times.

- dur: time values, the next level is acquired after duration
- reset: resets _level_ and _dur_ when triggered.
- level: demand Ugen providing the output values

Demand Ugen as durations:

```
let freq = Duty(
	Drand(inf, [0.01 0.2 0.4]),
	0,
	Dseq(inf, [204 400 201 502 300 200])
).Lag(0.2);
SinOsc(freq * [1 1.01], 0) * 0.1
```

Control rate ugen as durations:

```
let freq = Duty(
	MouseX(0.001, 2, 1, 0.2),
	0,
	Dseq(inf, [204 400 201 502 300 200])
);
SinOsc(freq * [1 1.01], 0) * 0.1
```

Control rate resetting the demand ugens:

```
let freq = Duty(
	Dseq(inf, [0.2, 0.3, 0.4, Dseq(inf, [1 1 1 2 1 2])]) / 2,
	Dust(1).kr,
	Dseq(inf, [0, 1, 2, Dseq(inf, [1 .. 5])])
) * 30 + 250;
SinOsc(freq * [1 1.01], 0) * 0.1
```

Demand rate reset:

```
let freq = Duty(
	Dseq(inf, [0.2, 0.3, 0.4, Dseq(inf, [1 1 1 2 1 2])]) / 2,
	Dseq(inf, [1 2 4 5]),
	Dseq(inf, [0, 1, 2, Dseq(inf, [1 .. 5])])
) * 30 + 250;
SinOsc(freq * [1 1.01], 0) * 0.1
```

Demand Ugen as audio oscillator:

```
let n = 5;
let m = 64;
let a = {
	let x = [
		{ randomFloat(-0.2, 0.2) } ! m,
		{ Drand(1, { randomFloat(-0.2, 0.2) } ! n) } ! m.atRandom
	].concatenation;
	Dseq(inf, x.scramble)
} ! n;
Duty(
	MouseX(1, 125, 1, 0.2) * SampleDur() * [1, 1.02],
	0,
	Dswitch1(MouseY(0, n - 1, 0, 0.2), a)
)
```

With non-demand inputs:

```
let freq = LfNoise2(1).Range(111, 555);
let latchFreq = Duty(MouseX(0.1, 1, 1, 0.2), 0, freq);
SinOsc([freq, latchFreq], 0) * 0.1
```

* * *

See also: Latch, TDuty
