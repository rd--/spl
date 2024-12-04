# ! (exclamationMark)

- _aNumber.!_
- _anObject ! shape_

`!` is both an operator and a syntax token.

As an operator,
the unary form answers the `factorial` of _aNumber_ if it is a non-negative integer,
else it answers `gamma`:

At integral `SmallFloat` and `LargeInteger`:

```
>>> 9.!
362880

>>> 25n.!
15511210043330985984000000n
```

At `Range`:

```
>>> 1:9.!
[1 2 6 24 120 720 5040 40320 362880]
```

Evaluate at real values:

```
>>> 1.5.!
1.32934

>>> (22 / 10).!
2.42397
```

Plot over a subset of the reals:

~~~
(-5 -- 5).functionPlot { :x |
	x.!.clip(-10, 10)
}
~~~

![](sw/spl/Help/Image/exclamationMark-A.svg)

Plot the volume of the unit hypersphere as a function of dimension:

~~~
(0 -- 25).functionPlot { :n |
	pi ^ (n / 2) / (n / 2).!
}
~~~

![](sw/spl/Help/Image/exclamationMark-B.svg)

In the binary case there two meanings depending on the type of the operand.
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

An empty shape answers a scalar value:

```
>>> { 'x' } ! []
'x'
```

With external state:

```
>>> let x = 1;
>>> { x := x * 2; x } ! 5
[2 4 8 16 32]

>>> let r = Sfc32(12345);
>>> r.randomInteger(1, 9, [5])
[8 5 9 9 4]
```

The name of this operator is `exclamationMark`.

As a syntax token `!` is part of `Type Definition Syntax`.

Answer a `List` constructed by evaluating a no-argument block the indicated number of times.

```
{
	SinOsc(IRand(48, 72).MidiCps, 0) * Rand(0.05, 0.1)
} ! 2
```

Ordinarily _anObject_ is a no-argument _Block_ and each element of the answer is a result of evaluating the block.

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

See also: !^, !+, #, duplicateInteger, duplicateShape, factorial, fill, List

Guides: Type Definition Syntax

Unicode: ! U+00021 Exclamation Mark

Categories: Copying
