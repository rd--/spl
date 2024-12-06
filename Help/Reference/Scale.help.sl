# Scale

- _Scale(startIndex, intervals, description)_

A `Scale` is a sub-set of the indices of a `Tuning`.

_startIndex_ is the index at the `Tuning` of the first note of the scale, and is usually one.

_intervals_ is a sequence of integers giving the distance of each index from the last.

_description_ is a `String` describing the scale.

The `size` of a scale is the size of the _intervals_ sequence,
a seven note scale has size seven.

The `tuningSize` of a scale is the `sum` of the _intervals_ sequence,
a seven note scale into a twelve-note tuning has a tuning size of twelve.

The `tuningIndices` of a scale are the indices into a `Tuning` of the required size.

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Major')
>>> .tuningIndices
[1 3 5 6 8 10 12]
```

`degreeToKey` indexes a scale by _degree_:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Major')
>>> .degreeToKey(1:7)
[1 3 5 6 8 10 12]
```

The file _modename.par_ in the [Scala](https://www.huygens-fokker.org/scala/) distribution includes many scales.

* * *

See also: asScale, degreeToKey, Tuning

References:
_Scala_
[1](https://www.huygens-fokker.org/scala/)

Categories: Music, Type
