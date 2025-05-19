# tuningSize

- _tuningSize(aScale)_

Of a `Scale`,
answers the number of steps per octave.

```
>>> 'Major'.namedScale.tuningSize
12
```

This is the `sum` of the scale intervals:

```
>>> 'Major'.namedScale.intervals.sum
12
```

The `size` of a scale is the number of steps:

```
>>> 'Major'.namedScale.size
7
```

which is the size of the `intervals`:

```
>>> 'Major'.namedScale.intervals.size
7
```

* * *

See also: intervals, Scale

Guides: Scale Functions, Tuning Functions
