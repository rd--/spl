# ! (exclamationMark)

- _x.!_
- _x ! n_

In the unary case the operator form of `factorialOrGamma`:

```
>>> 9.!
factorialOrGamma(9)
```

In the binary case the operator form of `duplicate`:

```
>>> { 1 } ! [2 3]
duplicate({ 1 }, [2 3])
```

The name of this operator is `exclamationMark`.

`!` is both an operator and a syntax token.
As a syntax token `!` is part of `Type Definition Syntax`.

`!` is a SuperCollider idiom:

```
{
	SinOsc(
		IRand(48, 72).MidiCps,
		0
	) * Rand(0.05, 0.1)
} ! 2
```

The particular case of duplicating a signal function and then panning it:

```
{ :tr |
	SinOsc(
		{
			TiRand(48, 72, tr).MidiCps
		} ! 7,
		0
	).Splay * 0.1
}.OverlapTexture(4, 4, 2).Mix
```

can be written more simply using the `!^` operator:

```
{ :tr |
	{
		SinOsc(
			TiRand(48, 72, tr).MidiCps,
			0
		)
	} !^ 7 * 0.1
}.OverlapTexture(4, 4, 2).Mix
```

* * *

See also: #, !^, duplicate, factorialOrGamma

Guides: Binary Operators, Type Definition Syntax

Unicode: ! U+00021 Exclamation Mark

Categories: Copying
