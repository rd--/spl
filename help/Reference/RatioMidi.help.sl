# RatioMidi

- _RatioMidi(aNumber)_

Convert interval as frequency ratio to midi note number.

Inverse of `MidiRatio`.

```
>>> 2.RatioMidi
12
```

A rational perfect fifth is 702 cents:

```
>>> ((3 / 2).RatioMidi * 100).rounded
702
```

Generate Pythagorean scale:

```
let genScale = { :ratio |
	0:11.collect { :each |
		(ratio ^ each).RatioMidi % 12
	}
};
let notes = 48 + genScale(3 / 2);
let amps = { Rand(0, 0.1) } ! 12;
Splay(
	SinOsc(notes.MidiCps, 0) * amps
)
```

* * *

See also: CpsMidi, MidiCps, MidiRatio

Categories: Arithmetic
