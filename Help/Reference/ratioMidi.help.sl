# ratioMidi

- _ratioMidi(x)_

Convert interval as frequency ratio to midi note number.
Alias for `ratioMidi`.

Inverse of `midiRatio`.

```
>>> 2.ratioMidi
12
```

A rational perfect fifth is 702 cents:

```
>>> ((3 / 2).ratioMidi * 100)
702
```

Generate Pythagorean scale:

~~~spl syn=A
let genScale = { :ratio |
	0:11.collect { :each |
		(ratio ^ each).ratioMidi % 12
	}
};
let notes = 48 + genScale(3 / 2);
let amps = { rand(0, 0.1) } ! 12;
splay(
	sinOsc(notes.midiCps, 0) * amps
)
~~~

Evaluate symbolically:

```
>> ratioMidi(`x`)
(* 12 (log x 2))
```

* * *

See also: cpsMidi, midiCps, midiRatio

Guides: Pitch Functions

Categories: Arithmetic
