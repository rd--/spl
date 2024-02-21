# Svf

12db/Oct State Variable Filter

- _Svf(signal, cutoff=2200, res=0.1, lowpass=1, bandpass=0, highpass=0, notch0, peak=0)_

- signal: audio in
- cutoff: cutoff frequency
- res: resonance (0 - 1)
- lowpass: lowpass filter output level (0-1)
- bandpass: bandpass filter output level. 0.0 - 1.0
- highpass: high filter output level. 0.0 - 1.0
- notch: notchfilter output level. 0.0 - 1.0
- peak: peak filter output level. 0.0 - 1.0

Filter sawtooth oscillator:

```
Svf(
	LfSaw(LfSaw(2, 0).LinLin(-1, 1, 110, 35), 0),
	MouseX(20, 20000, 1, 0.2),
	MouseY(1, 0, 0, 0.2),
	0.1, 0, 0, 0, 0
)
