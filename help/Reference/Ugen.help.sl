# Ugen

A `Type` representing a unit generator, specifically an output port at a SuperCollider unit generator.

Accessors are `scUgen` and `port`.

```
>>> SinOsc(440, 0).isUgen
true
```

Unit generator that have multiple outputs are represented as a `List` of `Ugen`:

```
>>> EqPan2(SinOsc(440, 0), 0).elementType
'Ugen'
```

* * *

See also: ScUgen, UgenGraph
