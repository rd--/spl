# ScUgen

A `Type` representing a primitive SuperCollider unit generator.

Accessors are:

- `name`: a `String`, the name of the unit generator
- `numberOfChannels`: an `Integer`, the number of channels
- `rate`: an `Integer`, the operating rate, initialization, control, audio or demand
- `specialIndex`: an `Integer` index, selects the operating mode of multiple-mode unit generators
- `id`: an `Integer`, unique within the context of graph
- `inputList`: a `List` of inputs, which may be constants, controls or unit generators
- `multipleRootGraph`: a `Set` of nodes that are attached to this node which would otherwise be disconnected
- `localControl`: `nil` unless a `LocalControl`, in which case the other fields are ignored

```
>>> let ugen = SinOsc(440, 0);
>>> let scUgen = ugen.scUgen;
>>> (scUgen.name, scUgen.numberOfChannels, scUgen.rate, scUgen.inputList)
('SinOsc', 1, 2, [440, 0])
```

* * *

See also: LocalControl, Ugen, UgenGraph
