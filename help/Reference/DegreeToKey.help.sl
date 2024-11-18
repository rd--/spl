# DegreeToKey

- _DegreeToKey(table, in, octave)_

Convert signal to modal pitch.

The input signal value is truncated to an integer value and used as an index into an octave repeating table of note values. Indices wrap around the table and shift octaves as they do.

- table: an instance of FloatList or Signal which contains the steps for each scale degree.
- in: the input signal.
- octave: the number of steps per octave in the scale. The default is 12.

Modal space, mouse controls discrete pitch in dorian mode:

```
let b = [0 2 3.2 5 7 9 10].asLocalBuf;
let k = DegreeToKey(b, MouseX(0, 15, 0, 0.1), 12);
let c = { :n :r |
	let o = SinOsc((r + k + (n * 0.04)).MidiCps, 0) * 0.1;
	let t = LfPulse([48, 55].MidiCps, 0, 0.15);
	let f = (SinOsc(0.1, 0) * 10 + r).MidiCps;
	let d = Rlpf(t, f, 0.1) * 0.1;
	let m = o + d;
	CombN(m, 0.31, 0.31, 2) + m
};
let n = LfNoise1([3, 3]);
(c(n, 48) + c(n, 72)) * 0.25
```

* * *

See also: asLocalBuf, degreeToKey

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/DegreeToKey.html)

Categories: Ugen
