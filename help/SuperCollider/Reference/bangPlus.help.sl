# !+ -- duplicate and Sum

- _anObject !+ anInteger_ ≡ (_anObject ! anInteger).Sum_

Names the idiom of generating an array and then immediately summing it.
This operator does not need to construct the intermediate array structure to calculate the answer.

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

* * *

See also: duplicate, sum
