# CombC -- comb filter

_CombC(in, maxdelaytime=0.2, delaytime=0.2, decaytime=1)_

Comb delay line. CombN uses no interpolation, CombL uses linear interpolation, CombC uses cubic interpolation.

- in: the input signal.
- maxdelaytime: the maximum delay time in seconds. used to initialize the delay buffer size.
- delaytime: delay time in seconds.
- decaytime: time for the echoes to decay by 60 decibels. If this time is negative then the feedback coefficient will be negative, thus emphasizing only odd harmonics at an octave lower.

Comb used as a resonator. The resonant fundamental is equal to reciprocal of the delay time.

	let z = WhiteNoise() * 0.01;
	CombC(z, 0.01, XLine(0.0001, 0.01, 20), 0.2)

With negative feedback:

	let z = WhiteNoise() * 0.01;
	CombC(z, 0.01, XLine(0.0001, 0.01, 20), -0.2)

Used as an echo:

	let z = Decay(Dust(1) * 0.5, 0.2) * WhiteNoise();
	CombC(z, 0.2, 0.2, 3)

