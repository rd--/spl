# !^ (exclamationMarkCircumflexAccent)

- _alpha !^ beta_ ⟹ _(alpha ! beta).splay_

Duplicate and distribute.
Names the idiom of generating an array and distributing it across the main ouput channels.

```
{ :tr |
	{
		let f = tChoose(
			tr,
			[48 .. 72]
		).midiCps;
		let ff = f * (
			sinOsc(
				tExpRand(4, 6, tr),
				0
			) * 0.008 + 1
		);
		lfSaw(
			ff * tRand(0.99, 1.01, tr),
			0
		) * 0.05
	} !^ 10
}.overlapTexture(2, 3, 4).mix
```

The name of this operator is `exclamationMarkCircumflexAccent`.

* * *

See also: !, !+, splay
