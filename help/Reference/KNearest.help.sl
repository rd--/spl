# KNearest

- _KNearest(numChannels=1, x=0, y=0, z=0, coordinateList)_

Calculate distances between an index location _(x, y, z)_ and each element of _coordinateList_.
Output a sequence of _numChannels_ zero-based indices into _coordinateList_,
sorted according to the least distance between the index location and the entries in the coordinate list.

- numChannels: the number of nearest coordinate indices to output
- x,y,z: cartesian coordinate of index location
- coordinateList: list of cartesian triples

Read index location from either Pen or Mouse input.
The distance from four equally spaced co-ordinates on the unit circle controls the relative amplitude of four distinctly high-pass filtered noise signals.

```
let k = 2;
let usePen = false;
let x = usePen.if { PenX(1) * 2 - 1 } { MouseX(-1, 1, 0, 0.2) };
let y = usePen.if { PenY(1) * 2 - 1 } { MouseY(-1, 1, 0, 0.2) };
let c = [-45, 45, 135, -135].collect { :each |
	[1, each.degreesToRadians, pi / 2].fromSphericalCoordinates
}.++;
let n = KNearest(k, x, y, 0, c);
let z = [
	SinOsc(333, 0),
	PinkNoise(),
	Saw(111) / 2,
	Pulse(555, 0.5) / 3
] * 0.1;
Select(n, z)
```

* * *

See also: Distances

Categories: Ugen
