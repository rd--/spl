# Trailing Procedure Syntax

Rewrite rules:

- _f { p }..._ ⇒ _f({ p }, ...)_
- _f(x, ...) { p }..._ ⇒ _f(x, ..., { p }, ...)_
- _x.f { p }..._ ⇒ _f(x, { p }, ...)_
- _x.f(y, ...) { p }..._ ⇒ _f(x, y, ..., { p }, ...)_

Trailing procedure syntax allows any number of concluding _literal_ procedure arguments to a procedure to be written outside the parameter list.
This notation is particularly clear for control structuring procedures such as _if_, _while_, _timesRepeat_ &etc.

The program below plays a simple texture of overlapping seven note chords, predominantly consisting of sine tones.
The two branches of the _if_ clause are written as trailing procedures.

	{
		{
			var freq = IRand(48, 72).MidiCps;
			(4 / 5).coin.if {
				SinOsc(freq, 0) * Rand(0.05, 0.1)
			} {
				Saw(freq) * Rand(0.01, 0.05)
			}
		}.dup(7).Splay2 / 7
	}.overlap(3, 3, 3)

See also [Trailing Dictionary Syntax].
