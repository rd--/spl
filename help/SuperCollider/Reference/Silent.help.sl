# Silent -- output silence

_Silent(numChannels)_

Output zero.
Equivalent to _{ Dc(0) } ! numChannels_.

Offset eight random sine tones by eight silent channels.

	Silent(8) ++ ({ SinOsc(Rand(200, 2000), 0) * 0.1 } ! 8)

* * *

See also: Dc
