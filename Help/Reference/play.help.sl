# play

- _play(x)_

Compile a unit-generator graph and send it to the synthesiser to be played.
The programs in the Help files do not include the `play` instruction,
it is used internally by the system when a expression is _played_.

At `Ugen`:

```
sinOsc(440, 0) * 0.1
```

At a `List` of `Ugen`:

```
[
	sinOsc(333, 0) * 0.1,
	saw(111) * 0.02
]
```

* * *

See also: List, Ugen, playAt, playEvery

Guides: SuperCollider Functions

Categories: Synthesiser
