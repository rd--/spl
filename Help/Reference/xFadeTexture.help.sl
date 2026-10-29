# xFadeTexture

- _xFadeTexture(newEventFunc/1, sustainTime, transitionTime)_

Crossfade events.
Creates a series of overlapped sounds from a user function.
The user function should return a graph of unit generators that produce a continuous sound.
xFadeTexture will apply an envelope to the sound to cross fade different invocations of the user function.

- newEventFunc: You supply a function that returns a graph of unit generators. If it returns nil, then no event is spawned this time. This function is passed one argument, a trigger that is reset for each new event.
- sustainTime: the sustain time (in beats) of the envelope.
- transitionTime: the transition time (in beats) of the envelope. The envelope transition is a welch envelope segment giving it a -3dB midpoint.

There are many examples of `xFadeTexture` in the help files.

A pair of sine oscillators crossfading between randomly shifting pitches and stereo locations.

~~~spl syn=A
{ :tr |
	eqPan(
		sinOsc(
			tiRand(48, 72, tr)
			.midiCps,
			0
		),
		tRand(-1, 1, tr)
	) * 0.1
}.xFadeTexture(2, 0.5)
~~~

* * *

See also: overlapTexture, xFadeTextureProgram

Guides: SuperCollider Functions, Unit Generators

Categories: Ugen, Texture
