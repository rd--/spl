# Scale -- music type

- _Scale(startIndex, intervals, description)_

A _Scale_ is a sub-set of the indices of a _Tuning_.

The _startIndex_ is the index at the Tuning of the first note of the scale, and is usually one.

The _intervals_ are a sequence of integers giving the distance of each index from the last.

The _description_ is a string describing the scale.

The _size_ of a scale is the size of the _intervals_ sequence,
a seven note scale has size seven.

The _tuningSize_ of a scale is the _sum_ of the _intervals_ sequence,
a seven note scale into a twelve-note tuning has a tuning size of twelve.

The _tuningIndices_ of a scale are the indices into a Tuning of the required size.

```
>>> Scale(1, [2 2 1 2 2 2 1], "Major").tuningIndices
[1 3 5 6 8 10 12]
```

The file _modename.par_ in the [Scala](https://www.huygens-fokker.org/scala/) distribution includes many scales.

* * *

See also: Tuning
