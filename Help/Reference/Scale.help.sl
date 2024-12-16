# Scale

- _Scale(startIndex, intervals, description)_

A `Scale` is a sub-set of the indices of a `Tuning`.

_startIndex_ is the index at the `Tuning` of the first note of the scale,
and is usually one.

_intervals_ is a sequence of integers giving the distance of each index from the last.

_description_ is a `String` describing the scale.

The `nameList` of a scale is the `description` separated into parts by the substring ', '.

The `size` of a scale is the size of the _intervals_ sequence,
a seven note scale has size seven.

The `tuningSize` of a scale is the `sum` of the _intervals_ sequence,
a seven note scale into a twelve-note tuning has a tuning size of twelve.

The `tuningIndices` of a scale are the indices,
starting from one,
into a `Tuning` of the required size.

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Major')
>>> .tuningIndices
[1 3 5 6 8 10 12]
```

`degreeToKey` indexes a scale by _degree_:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .degreeToKey(1:7)
[1 3 5 6 8 10 12]
```

The `stepArity`, also called step variety, of a scale is the number of step sizes:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .stepArity
2
```

`intervalsBy` tells the cyclic intervals at a specified distance, `intervals` is `intervalsBy` of `one`:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> (1 .. 7).collect { :each |
>>> 	s.intervalsBy(each)
>>> }
[
	2 2 1 2 2 2 1;
	4 3 3 4 4 3 3;
	5 5 5 6 5 5 5;
	7 7 7 7 7 7 6;
	9 9 8 9 9 8 8;
	11 10 10 11 10 10 10;
	12 12 12 12 12 12 12
]
```

The `intervalClass` of a scale is the set of intervals in the answer of `intervalsBy`,
that is set of specific intervals at a given generic interval:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> (1 .. 7).collect { :each |
>>> 	s.intervalClass(each)
>>> }
[1 2; 3 4; 5 6; 6 7; 8 9; 10 11; 12]
```

`intervalClasses` answers the `intervalClass` for each possible generic interval in sequence:

```
>>> Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
>>> .intervalClasses
[2 3; 4 5; 7 8; 9 10; 12]
```

A scale `isStrictlyProper` (Rothenberg 1977) if its `intervalClasses` are strictly ascending:

```
>>> Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
>>> .isStrictlyProper
true

>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .isStrictlyProper
false
```

A scale `isProper` (Rothenberg 1977) if its `intervalClasses` are ascending,
allowing equal elements at adjacent steps:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .isProper
true
```

An improper scale is a scale that is not proper:

```
>>> Scale(1, [2 1 4 1 4], 'Hirajōshi')
>>> .isImproper
true

>>> Scale(1, [1 3 2 2 1 1], 'Enigmatic')
>>> .isImproper
true
```

A scale `isMomentOfSymmetry` if each `intervalClass`,
with the exception of the _period_,
contains two intervals:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .isMomentOfSymmetry
true

>>> Scale(1, [2 1 2 2 2 2 1], 'Mel. Min.')
>>> .isMomentOfSymmetry
false
```

* * *

See also: asScale, degreeToKey, intervalClass, intervalClasses, isBinary, isMomentOfSymmetry, isProper, isTernary, isStrictlyProper, scalaScaleArchive, stepArity, Tuning

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_class)
[2](https://en.xen.wiki/w/Step_variety)

Further Reading: Rothenberg 1977

Categories: Music, Type
