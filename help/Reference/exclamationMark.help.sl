# !

- _anObject ! (anInteger | aSequence)_

In the `Integer` case,
evaluate _value(anObject)_ _anInteger_ times and collect the results into a `List`.

```
>>> { 1 } ! 3
[1 1 1]

>>> 1 ! 3
[1 1 1]
```

In the `Sequence` case,
evaluate _value(anObject)_ to fill an array of the indicated shape:

```
>>> { 1 } ! [2 3]
[1 1 1; 1 1 1]

>>> 1 ! [3 2 3]
[1 1 1; 1 1 1:; 1 1 1; 1 1 1:; 1 1 1; 1 1 1]

>>> 'x' ! [3 2]
['x' 'x'; 'x' 'x'; 'x' 'x']
```

With external state:

```
>>> let x = 1;
>>> { x := x * 2; x } ! 5
[2 4 8 16 32]

>>> let r = Random(12345);
>>> { r.nextRandomInteger(9) } ! 5
[8 5 9 9 4]
```

The name of this operator is _exclamationMark_.

Answer a _List_ constructed by evaluating a no-argument block the indicated number of times.

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

See also: !^, !+, #, duplicateInteger, duplicateShape, fill, List

Categories: Copying
