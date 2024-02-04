# !

- _p ! q_

! is defined as _duplicate_ at _Block_ and as _replicate_ at _Object_.

	3 ! 5 = [3 3 3 3 3]
	let x = 1; { x := x * 2; x } ! 5 = [2 4 8 16 32]

The name of this operator is _bang_.

Answer an _List_ constructed by evaluating a no-argument block the indicated number of times.

```
{
	SinOsc(IRand(48, 72).MidiCps, 0) * Rand(0.05, 0.1)
} ! 2
```

Ordinarily _aValue_ is a no-argument _Block_ and each element of the answer is a result of evaluating the block.

```
{ :tr |
	SinOsc({ TiRand(48, 72, tr).MidiCps } ! 7, 0).Splay * 0.1
}.OverlapTexture(4, 4, 2).Mix
```

This can be more written more simply using the _!^_ operator as:

```
{ :tr |
	{ SinOsc(TiRand(48, 72, tr).MidiCps, 0) } !^ 7 * 0.1
}.OverlapTexture(4, 4, 2).Mix
```

* * *

See also: duplicate, replicate

Categories: Copying
