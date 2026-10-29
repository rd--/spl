# medianFilter

- _medianFilter(x, r)_

Filters _x_ by replacing every value by the median of the values in a range-_r_ neighbourhood.
The distance function is `euclideanDistance`.

Median filter of a list:

```
>>> [1 2 3 2 1].medianFilter(1)
[3/2 2 2 2 3/2]
```

Median filtering of a numeric vector:

```
>>> [0 3 8 2].medianFilter(1)
[3/2 3 3 5]
```

Relation to `movingMap` and `median`:

```
>>> [1 0 -1 1 2 3 1 -1 0 1]
>>> .medianFilter(1)
[1/2 0 0 1 2 2 1 0 0 1/2]

>>> median/1.movingMap(
>>> 	[1 0 -1 1 2 3 1 -1 0 1],
>>> 	3
>>> )
[0 0 1 2 2 1 0 0]
```

Relation to `arrayFilter` and `median`:

```
>>> [2 3 80 6 2 3].medianFilter(1)
[5/2 3 6 6 3 5/2]

>>> median/1.arrayFilter(
>>> 	[2 3 80 6 2 3],
>>> 	1
>>> )
[2 3 6 6 3 3]
```

This non linear filter is good at reducing impulse noise from a signal.
At `Ugen`,
_r_ must be odd number from 1 to 15.

A signal with impulse noise.

~~~spl syn=A
let a = saw(500) * 0.1;
let b = dust2(100) * 0.9;
a + b
~~~

After applying median filter:

~~~spl syn=B
let a = saw(500) * 0.1;
let b = dust2(100) * 0.9;
medianFilter(a + b, 1)
~~~

The median length can be increased for longer duration noise.

A signal with longer impulse noise:

~~~spl syn=C
let a = saw(500) * 0.1;
let b = lpz1(dust2(100) * 0.9);
a + b
~~~

_r=1_,
a neighbourhood of three,
does not help here because the impulses are two samples long:

~~~spl syn=D
let a = saw(500) * 0.1;
let b = lpz1(dust2(100) * 0.9);
medianFilter(a + b, 1)
~~~

_r=2_ does better:

~~~spl syn=E
let a = saw(500) * 0.1;
let b = lpz1(dust2(100) * 0.9);
medianFilter(a + b, 2)
~~~

Long median filters begin chopping off the peaks of the waveform:

~~~spl syn=F
let x = sinOsc(1000, 0) * 0.1;
xFade2(
	x,
	medianFilter(x, 15),
	mouseX(-1, 1, 0, 0.2), 1
)
~~~

Another noise reduction application:

~~~spl syn=G
let a = whiteNoise();
let b = sinOsc(800, 0);
a + b * 0.1
~~~

Use MedianFilter filter for high frequency noise:

~~~spl syn=H
let a = whiteNoise();
let b = sinOsc(800, 0);
medianFilter(a + b, 15) * 0.1
~~~

Use `leakDc` for low frequency noise:

~~~spl syn=I
let a = whiteNoise();
let b = sinOsc(800, 0);
leakDc(
	medianFilter(a + b, 15),
	0.9
) * 0.1
~~~

* * *

See also: euclideanDistance, meanFilter, median, trimmedMean

Guides: Filter Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MedianFilter.html),
_W_
[1](https://en.wikipedia.org/wiki/Median_filter)
