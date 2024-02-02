# Pulse -- band limited pulse wave

_Pulse(freq=440, width=0.5)_

Band limited pulse wave generator with pulse width modulation.

- freq: frequency in Hertz
- width: pulse width ratio from zero to one. 0.5 makes a square wave.

Modulate frequency:

	Pulse(XLine(40, 4000, 6), 0.1) * 0.1

Modulate pulse width:

	Pulse(200, Line(0.01, 0.99, 8)) * 0.1

Two band limited square waves thru a resonant low pass filter:

	Rlpf(Pulse([100, 250], 0.5) * 0.1, XLine(8000, 400, 5), 0.05)

