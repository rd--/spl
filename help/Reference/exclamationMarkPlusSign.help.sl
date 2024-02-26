# !+

- _alpha !+ beta_ => _(alpha ! beta).Sum_

Duplicate and Sum.
Names the idiom of generating a list and then immediately summing it.
This operator does not need to construct the intermediate list structure to calculate the answer.

```
{ :tr |
	{
		let f = Choose(tr, [48 .. 72]).MidiCps;
		let ff = f * (SinOsc(TExpRand(4, 6, tr), 0) * 0.008 + 1);
		LfSaw(
			[
				ff * TRand(0.99, 1.01, tr),
				ff * TRand(0.99, 1.01, tr)
			],
			0
		) * 0.01
	} !+ 10
}.OverlapTexture(2, 3, 4).Mix
```

* * *

See also: !, !^, Sum
