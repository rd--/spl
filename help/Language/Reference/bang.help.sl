# ! -- duplicate

- _p ! q_ ⟹ _bang(p, q)_

! is defined as _duplicate_ at _Block_ and as _replicate_ at _Object_.

Answer an _Array_ constructed by evaluating a no-argument block the indicated number of times.

```
{
	SinOsc(IRand(48, 72).MidiCps, 0) * Rand(0.05, 0.1)
} ! 2
```

Ordinarily _aValue_ is a no-argument _Block_ and each element of the answer is a result of evaluating the block.

```
{
	SinOsc({ IRand(48, 72).MidiCps } ! 7, 0).Splay2 * 0.1
}.overlap(4, 4, 2)
```

This can be more written more simply using the _!^_ operator as:

```
{
	{ SinOsc(IRand(48, 72).MidiCps, 0) } !^ 7 * 0.1
}.overlap(4, 4, 2)
```

* * *

See also: duplicate, replicate
