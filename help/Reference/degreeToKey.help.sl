# degreeToKey

- _degreeToKey(aScale, degree)_
- _degreeToKey(degree, scale, stepsPerOctave)_

Convert from degree to key.

In the binary case, the _scale_ is an instance of `Scale`:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Major');
>>> 1:7.collect { :each | s.degreeToKey(each) }
[1 3 5 6 8 10 12]
```

Threads over lists:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Major');
>>> s.degreeToKey(1:7)
[1 3 5 6 8 10 12]
```

Allows fractional degrees, where 0.1 indicates a one step alteration.
The methods `sharp` and `flat` answer appropriately modified degrees:

```
>>> (1.sharp, 3.flat)
(1.1, 2.9)

>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Major');
>>> (
>>> 	s.degreeToKey([1 1.sharp 2 2.sharp 3 4 4.sharp 5 5.sharp 6 6.sharp 7]),
>>> 	s.degreeToKey([1 2.flat 2 3.flat 3 4 5.flat 5 6.flat 6 7.flat 7])
>>> )
([1 .. 12], [1 .. 12])

>>> let s = Scale(1, [2 1 2 2 1 2 2], 'Minor');
>>> s.degreeToKey([1 2.flat 2 3 3.sharp 4 5.flat 5 6 6.sharp 7 7.sharp])
[1 .. 12]
```

Likewise the methods `cancelFlat` and `cancelSharp`:

```
>>> (1.cancelFlat, 3.cancelSharp)
(1.1, 2.9)

>>> let s = Scale(1, [2 1 2 2 1 2 2], 'Minor');
>>> s.degreeToKey([1 2.flat 2 3 3.cancelFlat 4 5.flat 5 6 6.cancelFlat 7 7.cancelFlat])
[1 .. 12]
```

In the ternary case, which follows the _SuperCollider_ definition,
_scale_ is specified as a `List` and _stepsPerOctave_ separately,
and degrees are _zero-indexed_:

```
>>> 2.degreeToKey([1 3 6 8 10], 12)
6
```

Threads over lists:

```
>>> 0:7.degreeToKey([0 2 4 5 7 9 11], 12)
[0 2 4 5 7 9 11 12]
```

Indices wrap around the table and shift octaves as they do:

```
>>> 1:15.degreeToKey([0 1 5 9 11], 12)
[1 5 9 11 12 13 17 21 23 24 25 29 33 35 36]
```

* * *

See also: cancelFlat, cancelSharp, flat, Scale, sharp

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-degreeToKey)
[2](https://doc.sccode.org/Classes/DegreeToKey.html)

Categories: Converting
