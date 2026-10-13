# play

- _play(x)_

Compile a unit-generator graph and send it to the synthesiser to be played.
The programs in the Help files do not include the `play` instruction,
it is used internally by the system when a expression is _played_.

At `Ugen`:

```
SinOsc(440, 0) * 0.1
```

At a `List` of `Ugen`:

```
[
	SinOsc(333, 0) * 0.1,
	Saw(111) * 0.02
]
```

* * *

See also: List, Ugen, playAt, playEvery

Guides: SuperCollider Functions

Categories: Synthesiser
