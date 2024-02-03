# Distances

_Distances(x=0, y=0, z=0, coordinateArray)_

Calculate distances between an index location _(x, y, z)_ and each element of _coordinateArray_.

- x,y,z: cartesian coordinate of index location
- coordinateArray: array of cartesian triples

There are as many output channels as there are entries in _coordinateArray_,
ie. the output channel count is _coordinateArray.size / 3_.

The program below reads the index location from either Pen or Mouse input.
The distances from the index location to equally spaced co-ordinates on the unit circle controls the relative amplitude of each high-pass filtered noise signal.

```
let usePen = false;
let x = usePen.if { PenX(1) * 2 - 1 } { MouseX(-1, 1, 0, 0.2) };
let y = usePen.if { PenY(1) * 2 - 1 } { MouseY(-1, 1, 0, 0.2) };
let c = [-45, 45, 135, -135].collect { :each |
	SphericalCoordinate(1, each.degreesToRadians, pi / 2).asCartesianCoordinate.asArray
}.concatenation;
let g = 0.5 / Distances(x, y, 0, c);
let z = Hpf(PinkNoise(), ([1 .. 4] * 12 + 36).MidiCps);
(z * g).Splay
```

* * *

See also: KNearest

Categories: Ugen
