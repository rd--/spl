# RatioMidi

- _RatioMidi(x)_

Convert interval as frequency ratio to midi note number.
Alias for `ratioMidi`.

Inverse of `MidiRatio`.

```
>>> 2.RatioMidi
12
```

A rational perfect fifth is 702 cents:

```
>>> ((3 / 2).RatioMidi * 100)
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

Evaluate symbolically:

```
>> ratioMidi(`x`)
(* 12 (log2 x))
```

* * *

See also: CpsMidi, MidiCps, MidiRatio

Guides: Pitch Functions

Categories: Arithmetic
