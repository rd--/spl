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
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .tuningIndices
[1 3 5 6 8 10 12]
```

`degreeToKey` indexes a scale by _degree_:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .degreeToKey(1:7)
[1 3 5 6 8 10 12]
```

`stepArity` tells the number of step sizes:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .stepArity
2
```

`intervalsBy` tells the cyclic intervals at a specified distance:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> (1 .. 3).collect { :each |
>>> 	s.intervalsBy(each)
>>> }
[
	2 2 1 2 2 2 1;
	4 3 3 4 4 3 3;
	5 5 5 6 5 5 5
]
```

`intervalClass` tells the set of intervals in the answer of `intervalsBy`:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> (1 .. 7).collect { :each |
>>> 	s.intervalClass(each)
>>> }
[1 2; 3 4; 5 6; 6 7; 8 9; 10 11; 12]
```

`intervalClasses` answers the `intervalClass` for each generic interval in turn:

```
>>> Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
>>> .intervalClasses
[2 3; 4 5; 7 8; 9 10; 12]
```

`isStrictlyProper` tells if `intervalClasses` are strictly ascending:

```
>>> Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
>>> .isStrictlyProper
true
```

`isProper` tells if `intervalClasses` are descending,
allowing for equal elements:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .isProper
true
```

`isImproper` tells if a scale is not proper:

```
>>> Scale(1, [2 1 4 1 4], 'Hirajōshi')
>>> .isImproper
true
```

`isMomentOfSymmetry` tells if each `intervalClass`,
with the exception of the _period_,
contains two intervals:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .isMomentOfSymmetry
true
```

* * *

See also: asScale, degreeToKey, intervalClass, intervalClasses, intervals, intervalsBy, isMomentOfSymmetry, isProper, isStrictlyProper, scalaScaleArchive, stepArity, Tuning

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_class)
[2](https://en.xen.wiki/w/Step_variety)
[3](https://en.xen.wiki/w/MOS_scale)

Further Reading: Rothenberg 1977

Categories: Music, Type
