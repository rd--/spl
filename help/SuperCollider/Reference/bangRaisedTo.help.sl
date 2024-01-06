# !^ -- duplicate and distribute

- _anObject !^ anInteger_
- _p !^ q_ ⟹ bangRaisedTo(p, q)_

Names the idiom of generating an array and distributing it across the main ouput channels.
_p !^ q_ is equivalent to _(p ! q).Splay_.

	{ :tr |
		{
			let f = Choose(tr, [48 .. 72]).MidiCps;
			let ff = f * (SinOsc(TExpRand(4, 6, tr), 0) * 0.008 + 1);
			LfSaw(ff * TRand(0.99, 1.01, tr), 0) * 0.05
		} !^ 10
	}.OverlapTexture(2, 3, 4).Mix

* * *

See also: Splay, !+
